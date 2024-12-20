extends PanelContainer

signal give_job(event, job)
signal give_value(event, val)
signal give_life
signal lost_all_money(job)
signal open_description(description)
signal close_description

@export var event: Event

@onready var display_title: Label = $VBoxContainer/display_title
@onready var display_description: Label = $VBoxContainer/display_description
@onready var option_1: Button = $VBoxContainer/HBoxContainer/option_1
@onready var option_2: Button = $VBoxContainer/HBoxContainer/option_2


#only for after-death
@onready var label: Label = $VBoxContainer/HBoxContainer/Label
@onready var name_enter: LineEdit = $VBoxContainer/HBoxContainer/name_enter
var new_name: String


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
			2:
				option_2.visible = false
				label.visible = true
				name_enter.visible = true
				option_1.text = event.value_name[0]
			3:
				option_1.text = event.job_options[0].job_title
				option_2.text = event.job_options[1].job_title


func _on_option_1_button_up() -> void:
	match event.type:
		0:
			emit_signal("give_job", event, event.job_options[0])
		1:
			emit_signal("give_value", event,  event.value_options[0])
		2:
			if new_name == '':
				GameSettings.player_name = 'Nameless'
			else:
				GameSettings.player_name = new_name
			emit_signal("give_life")
		3:
			emit_signal("lost_all_money", event.job_options[0])
			


func _on_option_2_button_up() -> void:
	match event.type:
		0:
			emit_signal("give_job", event, event.job_options[1])
		1:
			emit_signal("give_value", event, event.value_options[1])
		3:
			emit_signal("lost_all_money", event.job_options[1])


func option_1_mouse_entered() -> void:
	emit_signal("open_description", event.options_description[0])


func option_1_mouse_exit() -> void:
	emit_signal("close_description")
	

func option_2_mouse_entered() -> void:
	emit_signal("open_description", event.options_description[1])


func option_2_mouse_exit() -> void:
	emit_signal("close_description")


func _on_name_enter_text_changed(new_text: String) -> void:
	new_name = new_text
