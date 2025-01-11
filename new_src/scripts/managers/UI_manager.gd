extends Managers
class_name UIManager

@onready var wallet_label: Label = $status/VBoxContainer/finance_bar/HBoxContainer/VBoxContainer/wallet_label
@onready var job_label: Label = $status/VBoxContainer/finance_bar/HBoxContainer/VBoxContainer2/job_label
@onready var job_exp: ProgressBar = $status/VBoxContainer/finance_bar/HBoxContainer/VBoxContainer2/job_exp
@onready var salary_label: Label = $status/VBoxContainer/finance_bar/HBoxContainer/VBoxContainer/salary_label
@onready var jl_label: Label = $status/VBoxContainer/finance_bar/HBoxContainer/VBoxContainer2/jl_label
@onready var expenses_label: Label = $status/VBoxContainer/finance_bar/HBoxContainer/VBoxContainer/expenses_label
@onready var inventory_container: VBoxContainer = $status/VBoxContainer/inventory/HBoxContainer/ScrollContainer/VBoxContainer
@onready var title_granted: Label = $status/VBoxContainer/inventory/HBoxContainer/VBoxContainer/title_granted

@onready var open_char_stat: Button = $open_char_stat
@onready var status: Panel = $status

@export var finance_manager: FinanceManager
@export var character_manager: CharacterManager
@export var world: World

var ITEM_INV_CONTAINER = preload("res://new_src/objects/inventory_item/item_inv_container.tscn")

const _CONDITIONS_MET = preload("res://new_src/resources/conditions_met/ConditionsMet.tres")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("toggle_character_stats"):
		toggle_character_stats(!status.visible)

func _process(delta: float) -> void:
	wallet_label.text = str(finance_manager.wallet)
	job_label.text = str(finance_manager.current_job.job_title)
	salary_label.text = str(finance_manager.current_job.salary)
	jl_label.text = str(finance_manager.current_job.level)
	expenses_label.text = str(finance_manager.total_expenses)
	
	job_exp.max_value = finance_manager.current_job.max_exp
	job_exp.value = finance_manager.current_job.exp
	
	if _CONDITIONS_MET.conditions_met.get("item_conditions").has("Title"):
		title_granted.visible = true
	else:
		title_granted.visible = false

func add_to_inventory(item: Item) -> void:
	var inv_item_inst = ITEM_INV_CONTAINER.instantiate()
	inv_item_inst.item = item
	inv_item_inst.remove_item.connect(character_manager.remove_item)
	inv_item_inst.remove_item.connect(remove_item)
	inventory_container.add_child(inv_item_inst)

func remove_item(item: Item) -> void:
	for i in inventory_container.get_children():
		if i.item == item:
			i.queue_free()

func toggle_character_stats(toggle: bool) -> void:
	open_char_stat.visible = !toggle
	status.visible = toggle



func _on_open_char_stat_button_up() -> void:
	toggle_character_stats(true)


func _on_exit_char_stat_button_up() -> void:
	toggle_character_stats(false)


func _on_paused_menu_button_up() -> void:
	world.open_menu(true)
