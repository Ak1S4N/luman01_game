extends MarginContainer

signal item_has_bought(item)
signal show_item_desc(item_desc)
signal hide_item_desc

var item: Item

@onready var name_display: Label = $HBoxContainer/VBoxContainer/name
@onready var price_display: Label = $HBoxContainer/VBoxContainer/price


func _ready() -> void:
	name_display.text = "Name: " + item.item_name
	price_display.text = "Price: " + str(item.price)

func buy() -> void:
	emit_signal("item_has_bought", item)


func _on_button_mouse_entered() -> void:
	emit_signal("show_item_desc", item.item_description)


func _on_button_mouse_exited() -> void:
	emit_signal("hide_item_desc")
