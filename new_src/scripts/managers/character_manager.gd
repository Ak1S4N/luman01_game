extends Managers
class_name CharacterManager

@export var current_items: Array[Item]

@export var finance_manager: FinanceManager
@export var event_manager: EventManager
@export var ui_manager: UIManager

var job_exp_gain: float = 1
var skill_exp_gain: float = 1
var age: int = 12
var day: int = 0

@onready var name_label: Label = $"../../CanvasLayer/UI/status/VBoxContainer/character_desc/VBoxContainer/labels/name"
@onready var age_label: Label = $"../../CanvasLayer/UI/status/VBoxContainer/character_desc/VBoxContainer/labels/age"

var player_name: String

var _CONDITIONS_MET = preload("res://new_src/resources/conditions_met/ConditionsMet.tres")

func _ready() -> void:
	if not SaveLoad.is_new_game:
		load_data()
		name_label.text = "Name: " + player_name 
	else:
		if GameSettings.player_name:
			player_name = GameSettings.player_name
		name_label.text = "Name: " + player_name 
	
	
func _on_timer_timeout() -> void:
	if not GameSettings.paused and not GameSettings.on_event:
		if day <= 365:
			day += 1
		else:
			age += 1
			day = 0
		
		age_label.text = "Age: "+str(age)+"."+str(day)
		
	
	if age >= 28\
	and not _CONDITIONS_MET.conditions_met["character_conditions"].has("teenager"):
		_CONDITIONS_MET.conditions_met["character_conditions"].append("teenager")
	
	if age >= 75:
		event_manager.death_event()
	

func remove_item(item: Item) -> void:
	if current_items.has(item):
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
	SaveLoad.save(condition_data, "condition_data")
	print(_CONDITIONS_MET.conditions_met.keys())
	SaveLoad.save(inventory_data, "inventory")

func load_data() -> void:
	var conditions = _CONDITIONS_MET.conditions_met.keys()
	var condition_data: Dictionary = SaveLoad.load_data("condition_data", ["event_conditions", "item_conditions", "job_conditions", "character_conditions"])
	var inventory_data: Dictionary = SaveLoad.load_data("inventory", ["current_items"])
	var character_data: Dictionary = SaveLoad.load_data("player", ["age", "day", "name"])
	
	for i in inventory_data["current_items"]:
		current_items.append(i)
	
	for c in conditions:
		_CONDITIONS_MET.conditions_met[c] = condition_data.get(c)
	
	player_name = character_data.get("name")
	age = character_data.get("age")
	day = character_data.get("day")
