extends Control

@onready var label: Label = $Panel/Label
@onready var panel: Panel = $Panel

func _process(delta: float) -> void:
	global_position.y = get_global_mouse_position().y + -55.0
	global_position.x = get_global_mouse_position().x + 16.0

func show_description(description: String) -> void:
	panel.visible = true
	label.text = description

func hide_description() -> void:
	panel.visible = false
