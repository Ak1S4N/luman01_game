extends Node2D

@onready var paused_menu: Control = $CanvasLayer/paused_menu

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
