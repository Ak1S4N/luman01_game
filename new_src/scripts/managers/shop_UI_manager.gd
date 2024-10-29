extends Managers

@export var character_manager: CharacterManager
@onready var vbox_container: VBoxContainer = $shop/VBoxContainer/shop_list/ScrollContainer/VBoxContainer
@onready var shop: Panel = $shop
@onready var open_shop_btn: Button = $open_shop
@onready var hover_select: Control = $"../hover_select"

var ITEM_CONTAINER = preload("res://new_src/objects/shop_list_item/item_container.tscn")

var _CONDITIONS_MET = preload("res://new_src/resources/conditions_met/ ConditionsMet.tres")
#Add items here when desired

@export var item_list: Array[Item]

func _ready() -> void:
	for i in item_list:
		var item_instance = ITEM_CONTAINER.instantiate()
		item_instance.item = i
		item_instance.show_item_desc.connect(hover_select.show_description)
		item_instance.hide_item_desc.connect(hover_select.hide_description)
		item_instance.item_has_bought.connect(get_item)
		vbox_container.add_child(item_instance)
	


func get_item(item: Item) -> void:
	if not character_manager.current_items.has(item):
		character_manager.current_items.append(item)
		_CONDITIONS_MET.append_condition("item_conditions", item.item_name)
	


func open_shop() -> void:
	shop.visible = true
	open_shop_btn.visible = false
	


func exit_shop() -> void:
	shop.visible = false
	open_shop_btn.visible = true
	
