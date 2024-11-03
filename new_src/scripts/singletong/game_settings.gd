extends Node

var paused: bool = false
var on_event: bool = false

const BUS_LAYOUT = preload("res://default_bus_layout.tres")
var music_volume: float = -40
var sfx_volume: float = 0

var player_name: String


func _ready() -> void:
	AudioServer.set_bus_layout(BUS_LAYOUT)
	

func _process(delta: float) -> void:
	AudioServer.set_bus_volume_db(1, music_volume)
	AudioServer.set_bus_volume_db(2, sfx_volume)
	
