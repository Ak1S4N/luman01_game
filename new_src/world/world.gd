extends Node2D

@onready var paused_menu: Control = $CanvasLayer/paused_menu

func _input(event: InputEvent) -> void:
	#this is mainly for player UI inputs like Character Stats toggle or Main Menu
	if Input.is_action_just_pressed("main_menu"):
		paused_menu.visible = !paused_menu.visible
		
	
