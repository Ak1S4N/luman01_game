extends Managers
class_name AreaManager

signal enter_building(toggle, id)
signal next_map(map_number)

@export var interior_manager: InteriorManager
@onready var map_1: Control = $"../buildings/map1"
@onready var map_2: Control = $"../buildings/map2"


func _ready() -> void:
	if interior_manager:
		enter_building.connect(interior_manager.interact_building)

func change_map(toggle: bool) -> void:
	map_1.visible = !toggle
	map_2.visible = toggle



func _on_lumber_mill_button_up() -> void:
	emit_signal("enter_building", true, 0)


func _on_blacksmith_button_up() -> void:
	emit_signal("enter_building", true, 1)


func _on_farm_button_up() -> void:
	emit_signal("enter_building", true, 2)


func _on_fishing_hut_button_up() -> void:
	emit_signal("enter_building", true, 3)


func _on_hunting_lodge_button_up() -> void:
	emit_signal("enter_building", true, 4)


func _on_slave_quarters_button_up() -> void:
	emit_signal("enter_building", true, 5)


func _on_refugee_quarters_button_up() -> void:
	emit_signal("enter_building", true, 6)


func _on_next_map_button_up() -> void:
	emit_signal("next_map", 2)


func _on_next_map_2_button_up() -> void:
	emit_signal("next_map", 1)


func _on_lords_hall_button_up() -> void:
	emit_signal("enter_building", true, 12)


func _on_guild_hall_button_up() -> void:
	emit_signal("enter_building", true, 7)


func _on_masonry_button_up() -> void:
	emit_signal("enter_building", true, 8)


func _on_barracks_button_up() -> void:
	emit_signal("enter_building", true, 9)




func _on_monastery_button_up() -> void:
	emit_signal("enter_building", true, 10)



func _on_market_button_up() -> void:
	emit_signal("enter_building", true, 11)
