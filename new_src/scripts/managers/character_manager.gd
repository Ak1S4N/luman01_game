extends Managers
class_name CharacterManager

@export var current_items: Array[Item]

var job_exp_gain: float = 1
var skill_exp_gain: float = 1
var age: int = 12
var day: int = 1

@export var conditions_met: Dictionary = {
	"event_conditions": [],
	"item_conditions": [],
	"job_conditions": [],
	"character_conditions": []
}

@onready var name_label: Label = $"../../CanvasLayer/UI/status/VBoxContainer/character_desc/VBoxContainer/labels/name"
@onready var age_label: Label = $"../../CanvasLayer/UI/status/VBoxContainer/character_desc/VBoxContainer/labels/age"

func _on_timer_timeout() -> void:
	if not GameSettings.paused and not GameSettings.on_event:
		if day <= 365:
			day += 1
		else:
			age += 1
			day = 1
		
		age_label.text = "Age: "+str(age)+"."+str(day)
		
	
	if age >= 16\
	and not conditions_met["character_conditions"].has(16):
		append_condition("character_conditions", 16)


func append_condition(condition_type: String, condition_id: int) -> void:
	var conditions = conditions_met.keys()
	for c in conditions:
		if !conditions_met[c].has(condition_id):
			if condition_type == c\
			and !conditions_met[c].has(condition_id):
				conditions_met[c].append(condition_id)
	print(conditions_met)
	

func save_data() -> void:
	SaveLoad.save(conditions_met, "character_conditions")

func load_data() -> void:
	var conditions = conditions_met.keys()
	var condition_data = SaveLoad.load_data("character_conditions", conditions)
	
