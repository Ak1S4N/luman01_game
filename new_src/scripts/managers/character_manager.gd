extends Managers
class_name CharacterManager

@export var current_items: Array[Item]

@export var finance_manager: FinanceManager
@export var event_manager: EventManager
@export var ui_manager: UIManager

var job_exp_gain: float = 1
var skill_exp_gain: float = 1
var age: int = 15
var day: int = 0

var month: Dictionary = {
	1: "Jan",
	2: "Feb",
	3: "Mar",
	4: "Apr",
	5: "May",
	6: "Jun",
	7: "Jul",
	8: "Aug",
	9: "Sep",
	10: "Oct",
	11: "Nov",
	12: "Dec"
}
var current_month: String
var month_day: int = randi_range(0, 30)
var year: int = randi_range(1500, 1700)

var birth_day: Dictionary = {
	"Birthyear": 0,
	"Birthmonth": "NA",
	"Birthday": 0
}

@onready var name_label: Label = $"../../CanvasLayer/UI/status/VBoxContainer/character_desc/VBoxContainer/labels/name"
@onready var age_label: Label = $"../../CanvasLayer/UI/status/VBoxContainer/character_desc/VBoxContainer/labels/age"
@onready var date_label: Label = $"../../CanvasLayer/UI/status/VBoxContainer/character_desc/VBoxContainer/date_n_stuff/date_label"
@onready var birth_label: Label = $"../../CanvasLayer/UI/status/VBoxContainer/character_desc/VBoxContainer/date_n_stuff/birth_label"

var player_name: String

var _CONDITIONS_MET = preload("res://new_src/resources/conditions_met/ConditionsMet.tres")

func _ready() -> void:
	randomize()
	if not SaveLoad.is_new_game:
		load_data()
		name_label.text = "Name: " + player_name
		birth_label.text = birth_day.get("birthmonth") + " " + str(birth_day.get("birthday")) + ", " + str(birth_day.get("birthyear"))
	else:
		if GameSettings.player_name:
			player_name = GameSettings.player_name
		name_label.text = "Name: " + player_name
		var random_month = randi_range(1, 12)
		current_month = month[random_month]
		birth_day = {
			"birthyear": year,
			"birthmonth": current_month,
			"birthday": month_day
		}
	birth_label.text = birth_day.get("birthmonth") + " " + str(birth_day.get("birthday")) + ", " + str(birth_day.get("birthyear"))

func _on_timer_timeout() -> void:
	if not GameSettings.paused and not GameSettings.on_event:
		if day <= 360:
			day += 1
		else:
			age += 1
			day = 0
		
		if month_day < 30:
			month_day += 1
		else:
			var cm_int = month.find_key(current_month)
			var nm_int = cm_int + 1
			if nm_int > 12:
				year += 1
				nm_int = 1
			current_month = month.get(nm_int)
			month_day = 0
		
		
		date_label.text = current_month + " " + str(month_day)+ ", " + str(year)
		age_label.text = "Age: "+str(age)
		
		
		
	
	if age >= 28\
	and not _CONDITIONS_MET.conditions_met["character_conditions"].has("teenager"):
		_CONDITIONS_MET.conditions_met["character_conditions"].append("teenager")
	
	if age >= 75:
		event_manager.death_event()
	

func remove_item(item: Item) -> void:
	if current_items.has(item):
		if item.pay_type == "constant":
			finance_manager.add_to_total_expenses(-item.price)
		current_items.erase(item)
		_CONDITIONS_MET.conditions_met["item_conditions"].erase(item.item_name)

func new_character() -> void:
	for i in current_items:
		ui_manager.remove_item(i)
	_CONDITIONS_MET.conditions_met["item_conditions"].erase("Title")
	current_items.clear()
	job_exp_gain = 1
	skill_exp_gain = 1



func save_data() -> void:
	var condition_data = _CONDITIONS_MET.conditions_met
	var inventory_data = {
		"current_items": current_items
	}
	var births_and_dates_data = {
		"current_month": current_month,
		"current_day": month_day,
		"current_year": year,
		
		"birth_day": birth_day.get("birthday"),
		"birth_month": birth_day.get("birthmonth"),
		"birth_year": birth_day.get("birthyear")
	}
	
	
	SaveLoad.save(condition_data, "condition_data")
	SaveLoad.save(inventory_data, "inventory")
	SaveLoad.save(births_and_dates_data, "bnd_data")

func load_data() -> void:
	var conditions = _CONDITIONS_MET.conditions_met.keys()
	var condition_data: Dictionary = SaveLoad.load_data("condition_data", ["event_conditions", "item_conditions", "job_conditions", "character_conditions"])
	var inventory_data: Dictionary = SaveLoad.load_data("inventory", ["current_items"])
	var character_data: Dictionary = SaveLoad.load_data("player", ["age", "day", "name"])
	var bnd_data: Dictionary = SaveLoad.load_data("bnd_data", ["current_month", "current_day", "current_year", "birth_day", "birth_month", "birth_year"])
	
	
	
	for i in inventory_data["current_items"]:
		current_items.append(i)
	
	for c in conditions:
		_CONDITIONS_MET.conditions_met[c] = condition_data.get(c)
	
	player_name = character_data.get("name")
	age = character_data.get("age")
	day = character_data.get("day")
	
	current_month = bnd_data.get("current_month")
	month_day = bnd_data.get("current_day")
	year = bnd_data.get("current_year")
	
	birth_day = {
		"birthday": bnd_data.get("birth_day"),
		"birthmonth": bnd_data.get("birth_month"),
		"birthyear": bnd_data.get("birth_year")
	}
