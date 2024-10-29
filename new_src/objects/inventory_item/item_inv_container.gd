extends MarginContainer

signal remove_item(item)

var item: Item

@onready var name_display: Label = $HBoxContainer/VBoxContainer/name
@onready var price_display: Label = $HBoxContainer/VBoxContainer/price

func _ready() -> void:
	name_display.text = item.item_name
	price_display.text = str(item.price)


func _on_remove_button_up() -> void:
	emit_signal("remove_item", item)
	queue_free()
