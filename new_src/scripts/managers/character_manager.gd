extends Managers


@export var current_items: Array[Item]

var job_exp_gain: float = 1
var skill_exp_gain: float = 1
var age: int = 1
var day: int = 1

@export var conditions_met: Array[int]

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


func append_condition(condition_id: int) -> void:
	if !conditions_met.has(condition_id):
		conditions_met.append(condition_id)
	
	print(conditions_met)
	
