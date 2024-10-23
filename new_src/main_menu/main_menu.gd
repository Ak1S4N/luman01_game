extends CanvasLayer

const WORLD = preload("res://new_src/world/world.tscn")


func new_game() -> void:
	SaveLoad.is_new_game = true
	

func continue_game() -> void:
	SaveLoad.is_new_game = false
	

func settings() -> void:
	pass
	

func quit() -> void:
	get_tree().quit()
