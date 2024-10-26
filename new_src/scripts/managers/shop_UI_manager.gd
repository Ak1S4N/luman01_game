extends Managers

@export var character_manager: Managers
@onready var vbox_container: VBoxContainer = $shop/VBoxContainer/shop_list/ScrollContainer/VBoxContainer
@onready var shop: Panel = $shop
@onready var open_shop_btn: Button = $open_shop

const ITEM_CONTAINER = preload("res://new_src/objects/shop_list_item/item_container.tscn")


var item_list: Dictionary = {
	"test_item": 10,
	"test_hammer": 23
}

func _ready() -> void:
	for i in item_list.keys():
		var item_instance = ITEM_CONTAINER.instantiate()
		item_instance.item_name = i
		item_instance.item_has_bought.connect(get_item)
		vbox_container.add_child(item_instance)

func get_item(item_name: String) -> void:
	var condition_id = item_list.get(item_name)
	character_manager.append_condition(condition_id)


func open_shop() -> void:
	shop.visible = true
	open_shop_btn.visible = false
	


func exit_shop() -> void:
	shop.visible = false
	open_shop_btn.visible = true
