extends Managers

signal open_building

@onready var interior_buildings: Array = get_tree().get_nodes_in_group("interior")

@onready var lumber_mill: Control = $lumber_mill
@onready var fishing_hut: Control = $fishing_hut
@onready var farm: Control = $farm
@onready var blacksmith: Control = $blacksmith
@onready var hunting_lodge: Control = $hunting_lodge
@onready var slave_quarters: Control = $slave_quarters
@onready var refugee_quarters: Control = $refugee_quarters

func interact_building(toggle: bool, id: int) -> void:
	
	match id:
		0:
			lumber_mill.visible = toggle
		1:
			blacksmith.visible = toggle
		2:
			farm.visible = toggle
		3:
			fishing_hut.visible = toggle
		4: 
			hunting_lodge.visible = toggle
		5:
			slave_quarters.visible = toggle
		6:
			refugee_quarters.visible = toggle
		9:
			for building in interior_buildings:
				building.visible = toggle


func _on_exit_interior_button_up() -> void:
	interact_building(false, 9)
