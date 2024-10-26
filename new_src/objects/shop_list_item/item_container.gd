extends MarginContainer

signal item_has_bought(item_name)

var item_name: String
@onready var label: Label = $VBoxContainer/Label

func _ready() -> void:
	if item_name:
		label.text = "Name: " + item_name
	

func buy() -> void:
	emit_signal("item_has_bought", item_name)
