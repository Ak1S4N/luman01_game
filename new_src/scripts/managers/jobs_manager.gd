extends Managers

signal get_job(job)

@export var barracks: Array[Job]
@export var blacksmith: Array[Job]
@export var farm: Array[Job]
@export var fishing_hut: Array[Job]
@export var guild_hall: Array[Job]
@export var hunting_lodge: Array[Job]
@export var lords_hall: Array[Job]
@export var lumber_mill: Array[Job]
@export var market: Array[Job]
@export var masonry: Array[Job]
@export var monastery: Array[Job]
@export var refugee_quarters: Array[Job]
@export var slave_quarters: Array[Job]

func give_list(int_name: String):
	match int_name:
		'barracks':
			return barracks
		'blacksmith':
			return blacksmith
		'farm':
			return farm
		'fishing_hut':
			return fishing_hut
		'guild_hall':
			return guild_hall
		'hunting_lodge':
			return hunting_lodge
		'lords_hall':
			return lords_hall
		'lumber_mill':
			return lumber_mill
		'market':
			return market
		'monastery':
			return monastery
		'refugee_quarters':
			return refugee_quarters
		'slave_quarters':
			return slave_quarters
			
	

func job_transfer(job_rsc: Job) -> void:
	emit_signal("get_job", job_rsc)
