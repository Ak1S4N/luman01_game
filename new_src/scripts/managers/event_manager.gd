extends Managers

@export var first_event: Event
@export var random_general_event: Array[Event]

@export_range(0.0,1.0) var chance: float

@export var character_manager: CharacterManager
@export var finance_manager: FinanceManager

@export var hover_select: Control

const EVENT = preload("res://new_src/objects/event_scene/event.tscn")

var _CONDITIONS_MET = preload("res://new_src/resources/conditions_met/ ConditionsMet.tres")

func _ready() -> void:
	randomize()
	
	if SaveLoad.is_new_game == true:
		var event_instance = EVENT.instantiate()
		event_instance.event = first_event
		event_instance.give_job.connect(set_job)
		event_instance.open_description.connect(hover_select.show_description)
		event_instance.close_description.connect(hover_select.hide_description)
		add_child(event_instance)
		GameSettings.on_event = true
	else:
		load_events()

func _on_timer_timeout() -> void:
	if not GameSettings.paused and not GameSettings.on_event:
		random_general_event.shuffle()
		var rand_event = random_general_event[0]
		
		
		if rand_event.conditions_needed:
			var condition_type = _CONDITIONS_MET.conditions_met[rand_event.cond_type_needed]
			if condition_type.has(rand_event.conditions_needed):
				spawn_event(rand_event)
		else:
			spawn_event(rand_event)


func spawn_event(rand_event: Event) -> void:
	var randnum = randf_range(0.0, 1.0)
	if randnum <= chance:
		var event_instance = EVENT.instantiate()
		if not rand_event.has_occured:
			event_instance.event = rand_event
			event_instance.give_value.connect(new_value)
			event_instance.give_job.connect(set_job)
			event_instance.open_description.connect(hover_select.show_description)
			event_instance.close_description.connect(hover_select.hide_description)
			add_child(event_instance)
			GameSettings.on_event = true



func set_job(event: Event, new_job: Job):
	finance_manager.job_transfer(new_job)
	for i in get_children():
		if i.name == "event":
			i.queue_free()
	_CONDITIONS_MET.append_condition("event_conditions", event.event_title)
	event.has_occured = true
	GameSettings.on_event = false

func new_value(event: Event, value: int):
	finance_manager.add_exp(value)
	for i in get_children():
		if i.name == "event":
			i.queue_free()
	_CONDITIONS_MET.append_condition("event_conditions", event.event_title)
	event.has_occured = true
	GameSettings.on_event = false



func save_events() -> void:
	for event in random_general_event:
		var event_name = event.event_title
		var event_data: Dictionary = {
			"has_occured":event.has_occured
		}
		SaveLoad.save(event_data, event_name)
		

func load_events() -> void:
	for event in random_general_event:
		var event_data: Dictionary = SaveLoad.load_data(event.event_title, ["has_occured"])
		event.has_occured = event_data.get("has_occured")
		
		

func _print() -> void:
	print('okay naman')
