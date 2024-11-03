extends Node2D
class_name World

@onready var paused_menu: Control = $CanvasLayer/paused_menu

@export var area_manager: AreaManager
@onready var panorama: Node2D = $panorama

@onready var audio_stream_player: AudioStreamPlayer = $Audio/AudioStreamPlayer

const _CONDITIONS_MET = preload("res://new_src/resources/conditions_met/ConditionsMet.tres")

func _ready() -> void:
	area_manager.next_map.connect(change_panorama)

func _process(delta: float) -> void:
	audio_stream_player.volume_db = GameSettings.music_volume


func _input(event: InputEvent) -> void:
	#this is mainly for player UI inputs like Character Stats toggle or Main Menu
	if Input.is_action_just_pressed("main_menu"):
		if not paused_menu.visible:
			open_menu(true)
		else:
			open_menu(false)
		

func open_menu(toggle: bool) -> void:
	GameSettings.paused = toggle
	paused_menu.visible = toggle
	paused_menu.close_settings()

func change_panorama(id: int) -> void:
	var panorama_tween = panorama.create_tween()
	
	match id:
		1:
			panorama_tween.tween_property(panorama, "global_position", Vector2(0,0), 0.5)
			await panorama_tween.finished
			area_manager.change_map(false)
		2:
			panorama_tween.tween_property(panorama, "global_position", Vector2(1281.6,0), 0.5)
			await panorama_tween.finished
			area_manager.change_map(true)

func reset_game() -> void:
	_CONDITIONS_MET.reset_all_conditions()
	SaveLoad.is_new_game = true
	get_tree().change_scene_to_file("res://new_src/world/world.tscn")
