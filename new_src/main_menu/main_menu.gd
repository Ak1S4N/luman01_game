extends CanvasLayer

const WORLD = preload("res://new_src/world/world.tscn")

#signals

func new_game() -> void:
	SaveLoad.is_new_game = true
	get_tree().change_scene_to_file("res://new_src/world/world.tscn")
	

func continue_game() -> void:
	SaveLoad.is_new_game = false
	get_tree().change_scene_to_file("res://new_src/world/world.tscn")

func settings() -> void:
	pass
	

func quit() -> void:
	get_tree().quit()
