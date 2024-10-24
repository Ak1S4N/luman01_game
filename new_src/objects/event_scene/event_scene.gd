extends PanelContainer

signal give_job(event, job)
signal give_value(event, val)

@export var event: Event

@onready var display_title: Label = $VBoxContainer/display_title
@onready var display_description: Label = $VBoxContainer/display_description
@onready var option_1: Button = $VBoxContainer/HBoxContainer/option_1
@onready var option_2: Button = $VBoxContainer/HBoxContainer/option_2

func _ready() -> void:
	if event:
		display_title.text = event.event_title
		display_description.text = event.event_description
		
		match event.type:
			0:
				option_1.text = event.job_options[0].job_title
				option_2.text = event.job_options[1].job_title
			1:
				option_1.text = event.value_name[0]
				option_2.text = event.value_name[1]



func _on_option_1_button_up() -> void:
	match event.type:
		0:
			emit_signal("give_job", event, event.job_options[0])
		1:
			emit_signal("give_value", event,  event.value_options[0])


func _on_option_2_button_up() -> void:
	match event.type:
		0:
			emit_signal("give_job", event, event.job_options[1])
		1:
			emit_signal("give_value", event, event.value_options[1])
