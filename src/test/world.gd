extends Node2D


@onready var interior: Control = $CanvasLayer/interior/HBoxContainer/interior_bg
@onready var shop_text: TextureRect = $CanvasLayer/interior/HBoxContainer/interior_bg/shop_text
@onready var blacksmith_text: TextureRect = $CanvasLayer/interior/HBoxContainer/interior_bg/blacksmith_text
@onready var guild_hall: TextureRect = $CanvasLayer/interior/HBoxContainer/interior_bg/guild_hall

@onready var all_interior: Array = get_tree().get_nodes_in_group("Interior")

func open_place(toggle: bool, id: int) -> void:
	all_interior
	interior.visible = toggle
	match id:
		0:
			shop_text.visible = toggle
			blacksmith_text.visible = toggle
			guild_hall.visible = toggle
		1:
			shop_text.visible = toggle
		2:
			blacksmith_text.visible = toggle
		3:
			guild_hall.visible = toggle
	
	for n in all_interior:
		if toggle == true:
			n.mouse_filter = Control.MOUSE_FILTER_STOP
		else:
			n.mouse_filter = Control.MOUSE_FILTER_IGNORE


func _on_shop_button_up() -> void:
	open_place(true, 1)


func _on_exit_establishment_button_up() -> void:
	open_place(false, 0)


func _on_blacksmith_button_up() -> void:
	open_place(true, 2)


func _on_guild_hall_button_up() -> void:
	open_place(true, 3)
