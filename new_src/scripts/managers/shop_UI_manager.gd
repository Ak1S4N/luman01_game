extends Managers

@export var character_manager: CharacterManager
@onready var vbox_container: VBoxContainer = $shop/VBoxContainer/shop_list/ScrollContainer/VBoxContainer
@onready var shop: Panel = $shop
@onready var open_shop_btn: Button = $open_shop

const ITEM_CONTAINER = preload("res://new_src/objects/shop_list_item/item_container.tscn")

var _CONDITIONS_MET = preload("res://new_src/resources/conditions_met/ ConditionsMet.tres")
#Add items here when desired
var item_list: Dictionary = {
	"test_item": "Potion",
	"test_hammer": "Hammer"
}

func _ready() -> void:
	for i in item_list.keys():
		var item_instance = ITEM_CONTAINER.instantiate()
		item_instance.item_name = i
		item_instance.item_has_bought.connect(get_item)
		vbox_container.add_child(item_instance)

func get_item(item_name: String) -> void:
	var condition_id = item_list.get(item_name)
	_CONDITIONS_MET.append_condition("item_conditions", condition_id)


func open_shop() -> void:
	shop.visible = true
	open_shop_btn.visible = false
	


func exit_shop() -> void:
	shop.visible = false
	open_shop_btn.visible = true
	
