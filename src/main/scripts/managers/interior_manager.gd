extends Managers

signal open_building

@onready var interior_buildings: Array = get_tree().get_nodes_in_group("interior")

@onready var shop: Control = $shop
@onready var guild_hall: Control = $guild_hall

func interact_building(toggle: bool, id: int) -> void:
	match id:
		0:
			shop.visible = toggle
			emit_signal("open_building")
		1:
			guild_hall.visible = toggle
		2:
			pass
		9:
			for building in interior_buildings:
				building.visible = toggle

func _on_exit_button_button_up() -> void:
	interact_building(false, 9)
