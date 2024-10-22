extends Node2D

@onready var main_menu: Control = $CanvasLayer/main_menu

func _input(event: InputEvent) -> void:
	#this is mainly for player UI inputs like Character Stats toggle or Main Menu
	if Input.is_action_just_pressed("main_menu"):
		main_menu.visible = !main_menu.visible
	
	
