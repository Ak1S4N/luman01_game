extends CanvasLayer

#signals
const WORLD = preload("res://new_src/world/world.tscn")

var chosen_name: String

@onready var label: Label = $Label
@onready var menu: VBoxContainer = $VBoxContainer

@onready var new_character_menu: Panel = $new_character_menu

func new_game() -> void:
	SaveLoad.is_new_game = true
	label.visible = false
	menu.visible = false
	new_character_menu.visible = true

func continue_game() -> void:
	SaveLoad.is_new_game = false
	GameSettings.paused = false
	get_tree().change_scene_to_file("res://new_src/world/world.tscn")

func settings() -> void:
	pass
	

func quit() -> void:
	get_tree().quit()


func _on_start_game_button_up() -> void:
	SaveLoad.is_new_game = true
	GameSettings.player_name = chosen_name
	get_tree().change_scene_to_file("res://new_src/world/world.tscn")



func _on_exit_button_up() -> void:
	label.visible = true
	menu.visible = true
	new_character_menu.visible = false


func _on_name_edit_text_changed(new_text: String) -> void:
	chosen_name = new_text
