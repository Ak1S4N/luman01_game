extends Managers

signal enter_building(toggle, id)

@export var interior_manager: Managers


func _ready() -> void:
	if interior_manager:
		enter_building.connect(interior_manager.interact_building)

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
