extends MarginContainer

@export var item: Item

@onready var display_title: Label = $VBoxContainer/item_title
@onready var display_icon: TextureRect = $VBoxContainer/item_display
@onready var display_value: Label = $VBoxContainer/HBoxContainer/item_value
@onready var display_purpose: TextureRect = $VBoxContainer/HBoxContainer/TextureRect

func _ready() -> void:
	display_title.text = item.item_name
	display_icon.texture = item.item_icon
	display_value.text = str(item.value)
	
