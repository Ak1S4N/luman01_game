extends Panel

@onready var character_manager: Node = $"../../../../../finance_manager/character_manager"

const SHOP_ITEM = preload("res://src/main/objects/shop_item.tscn")
@onready var h_box_container: HBoxContainer = $ScrollContainer/HBoxContainer

func display_item() -> void:
	var current_items = character_manager.current_items
	
	
