extends Managers

signal enter_building(id)

@export var interior_manager: Managers

@onready var cs_button: Button = $"../UI/cs_button"
@onready var status: Panel = $"../UI/status"


func _ready() -> void:
	enter_building.connect(interior_manager.interact_building)

func toggle_character_stats(toggle: bool) -> void:
	cs_button.visible = !toggle
	status.visible = toggle

func _on_shop_button_up() -> void:
	emit_signal("enter_building", true, 0)


func _on_guild_hall_button_up() -> void:
	emit_signal("enter_building", true, 1)


func _on_cs_button_button_up() -> void:
	toggle_character_stats(true)


func _on_status_exit_button_up() -> void:
	toggle_character_stats(false)
