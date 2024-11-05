extends Managers
class_name ShopUI

@export var character_manager: CharacterManager
@export var finance_manager: FinanceManager
@export var ui_manager: UIManager

@onready var shop_list_container: VBoxContainer = $shop/VBoxContainer/shop_list/ScrollContainer/VBoxContainer
@onready var lords_hall_list_container: VBoxContainer = $lords_hall/VBoxContainer/shop_list/ScrollContainer/VBoxContainer
@onready var shop: Panel = $shop
@onready var lords_hall: Panel = $lords_hall
@onready var open_shop_btn: Button = $open_shop
@onready var hover_select: Control = $"../hover_select"
@onready var open_lords_hall_btn: Button = $open_lords_hall


var ITEM_CONTAINER = preload("res://new_src/objects/shop_list_item/item_container.tscn")

var _CONDITIONS_MET = preload("res://new_src/resources/conditions_met/ConditionsMet.tres")
#Add items here when desired

@export var shop_list: Array[Item]
@export var lords_hall_list: Array[Item]

func _ready() -> void:
	for i in shop_list:
		var item_instance = ITEM_CONTAINER.instantiate()
		item_instance.item = i
		item_instance.show_item_desc.connect(hover_select.show_description)
		item_instance.hide_item_desc.connect(hover_select.hide_description)
		item_instance.item_has_bought.connect(get_item)
		shop_list_container.add_child(item_instance)
	
	for i in lords_hall_list:
		var item_instance = ITEM_CONTAINER.instantiate()
		item_instance.item = i
		item_instance.show_item_desc.connect(hover_select.show_description)
		item_instance.hide_item_desc.connect(hover_select.hide_description)
		item_instance.item_has_bought.connect(get_title)
		lords_hall_list_container.add_child(item_instance)
	


func get_item(item: Item) -> void:
	if not character_manager.current_items.has(item):
		if item.pay_type == "constant":
			finance_manager.add_to_total_expenses(item.price)
			character_manager.current_items.append(item)
		elif item.pay_type == "one-time pay":
			finance_manager.wallet -= item.price
			character_manager.current_items.append(item)
		ui_manager.add_to_inventory(item)
		_CONDITIONS_MET.append_condition("item_conditions", item.item_name)


func get_title(item: Item) -> void:
	if not _CONDITIONS_MET.conditions_met.get("item_conditions").has("Title"):
		finance_manager.wallet -= item.price
		_CONDITIONS_MET.append_condition("item_conditions", "Title")

func open_shop() -> void:
	shop.visible = true
	open_lords_hall_btn.visible = false
	open_shop_btn.visible = false

func exit_shop() -> void:
	shop.visible = false
	open_lords_hall_btn.visible = true
	open_shop_btn.visible = true

func _on_open_lords_hall_button_up() -> void:
	if lords_hall.visible == false:
		open_lords_hall()

func open_lords_hall() -> void:
	lords_hall.visible = true
	open_lords_hall_btn.visible = false
	open_shop_btn.visible = false

func exit_lords_hall() -> void:
	lords_hall.visible = false
	open_lords_hall_btn.visible = true
	open_shop_btn.visible = true
