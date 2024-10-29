extends Control

@onready var world: Node2D = $"../.."
@onready var settings: Panel = $settings

@export var job_manager: JobManager
@export var finance_manager: FinanceManager
@export var event_manager: Managers
@export var character_manager: CharacterManager

@onready var music_scbar: HScrollBar = $settings/VBoxContainer/HBoxContainer/music_scbar
@onready var sound_scbar: HScrollBar = $settings/VBoxContainer/HBoxContainer2/sound_scbar
@onready var fullscreen_toggle: CheckButton = $settings/VBoxContainer/HBoxContainer3/fullscreen_toggle
@onready var button_screen: CenterContainer = $button_screen


func resume() -> void:
	GameSettings.paused = true
	world.open_menu(false)
	

func open_settings() -> void:
	settings.visible = true
	button_screen.visible = false
	

func close_settings() -> void:
	settings.visible = false
	button_screen.visible = true
	

func save_quit() -> void:
	job_manager.save()
	finance_manager.save()
	event_manager.save_events()
	character_manager.save_data()
	get_tree().change_scene_to_file("res://new_src/main_menu/main_menu.tscn")

func _process(delta: float) -> void:
	GameSettings.music_volume = music_scbar.value
	GameSettings.sfx_volume = sound_scbar.value
	
