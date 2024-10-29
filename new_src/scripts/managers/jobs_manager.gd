extends Managers
class_name JobManager

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

func _ready() -> void:
	if SaveLoad.is_new_game == false:
		load_data()

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


func save() -> void:
	for job in refugee_quarters:
		var job_name = job.job_title
		var job_data = {
			"job_salary":job.salary,
			"job_level": job.level,
			"job_exp": job.exp,
			"job_max_exp": job.max_exp
		}
		SaveLoad.save(job_data, job_name)
	
	for job in barracks:
		var job_name = job.job_title
		var job_data = {
			"job_salary":job.salary,
			"job_level": job.level,
			"job_exp": job.exp,
			"job_max_exp": job.max_exp
		}
		SaveLoad.save(job_data, job_name)
	
	for job in blacksmith:
		var job_name = job.job_title
		var job_data = {
			"job_salary":job.salary,
			"job_level": job.level,
			"job_exp": job.exp,
			"job_max_exp": job.max_exp
		}
		SaveLoad.save(job_data, job_name)

	for job in farm:
		var job_name = job.job_title
		var job_data = {
			"job_salary":job.salary,
			"job_level": job.level,
			"job_exp": job.exp,
			"job_max_exp": job.max_exp
		}
		SaveLoad.save(job_data, job_name)

	for job in fishing_hut:
		var job_name = job.job_title
		var job_data = {
			"job_salary":job.salary,
			"job_level": job.level,
			"job_exp": job.exp,
			"job_max_exp": job.max_exp
		}
		SaveLoad.save(job_data, job_name)

	for job in guild_hall:
		var job_name = job.job_title
		var job_data = {
			"job_salary":job.salary,
			"job_level": job.level,
			"job_exp": job.exp,
			"job_max_exp": job.max_exp
		}
		SaveLoad.save(job_data, job_name)

	for job in hunting_lodge:
		var job_name = job.job_title
		var job_data = {
			"job_salary":job.salary,
			"job_level": job.level,
			"job_exp": job.exp,
			"job_max_exp": job.max_exp
		}
		SaveLoad.save(job_data, job_name)

	for job in lumber_mill:
		var job_name = job.job_title
		var job_data = {
			"job_salary":job.salary,
			"job_level": job.level,
			"job_exp": job.exp,
			"job_max_exp": job.max_exp
		}
		SaveLoad.save(job_data, job_name)

	for job in market:
		var job_name = job.job_title
		var job_data = {
			"job_salary":job.salary,
			"job_level": job.level,
			"job_exp": job.exp,
			"job_max_exp": job.max_exp
		}
		SaveLoad.save(job_data, job_name)

	for job in masonry:
		var job_name = job.job_title
		var job_data = {
			"job_salary":job.salary,
			"job_level": job.level,
			"job_exp": job.exp,
			"job_max_exp": job.max_exp
		}
		SaveLoad.save(job_data, job_name)

	for job in monastery:
		var job_name = job.job_title
		var job_data = {
			"job_salary":job.salary,
			"job_level": job.level,
			"job_exp": job.exp,
			"job_max_exp": job.max_exp
		}
		SaveLoad.save(job_data, job_name)

	for job in slave_quarters:
		var job_name = job.job_title
		var job_data = {
			"job_salary":job.salary,
			"job_level": job.level,
			"job_exp": job.exp,
			"job_max_exp": job.max_exp
		}
		SaveLoad.save(job_data, job_name)

func load_data() -> void:
	for job in refugee_quarters:
		var job_data: Dictionary = SaveLoad.load_data(job.job_title, ["job_salary", "job_level", "job_exp", "job_max_exp"])
		job.salary = job_data.get("job_salary")
		job.level = job_data.get("job_level")
		job.exp = job_data.get("job_exp")
		job.max_exp = job_data.get("job_max_exp")

	for job in barracks:
		var job_data: Dictionary = SaveLoad.load_data(job.job_title, ["job_salary", "job_level", "job_exp", "job_max_exp"])
		job.salary = job_data.get("job_salary")
		job.level = job_data.get("job_level")
		job.exp = job_data.get("job_exp")
		job.max_exp = job_data.get("job_max_exp")

	for job in blacksmith:
		var job_data: Dictionary = SaveLoad.load_data(job.job_title, ["job_salary", "job_level", "job_exp", "job_max_exp"])
		job.salary = job_data.get("job_salary")
		job.level = job_data.get("job_level")
		job.exp = job_data.get("job_exp")
		job.max_exp = job_data.get("job_max_exp")

	for job in farm:
		var job_data: Dictionary = SaveLoad.load_data(job.job_title, ["job_salary", "job_level", "job_exp", "job_max_exp"])
		job.salary = job_data.get("job_salary")
		job.level = job_data.get("job_level")
		job.exp = job_data.get("job_exp")
		job.max_exp = job_data.get("job_max_exp")

	for job in fishing_hut:
		var job_data: Dictionary = SaveLoad.load_data(job.job_title, ["job_salary", "job_level", "job_exp", "job_max_exp"])
		job.salary = job_data.get("job_salary")
		job.level = job_data.get("job_level")
		job.exp = job_data.get("job_exp")
		job.max_exp = job_data.get("job_max_exp")

	for job in guild_hall:
		var job_data: Dictionary = SaveLoad.load_data(job.job_title, ["job_salary", "job_level", "job_exp", "job_max_exp"])
		job.salary = job_data.get("job_salary")
		job.level = job_data.get("job_level")
		job.exp = job_data.get("job_exp")
		job.max_exp = job_data.get("job_max_exp")

	for job in hunting_lodge:
		var job_data: Dictionary = SaveLoad.load_data(job.job_title, ["job_salary", "job_level", "job_exp", "job_max_exp"])
		job.salary = job_data.get("job_salary")
		job.level = job_data.get("job_level")
		job.exp = job_data.get("job_exp")
		job.max_exp = job_data.get("job_max_exp")

	for job in lumber_mill:
		var job_data: Dictionary = SaveLoad.load_data(job.job_title, ["job_salary", "job_level", "job_exp", "job_max_exp"])
		job.salary = job_data.get("job_salary")
		job.level = job_data.get("job_level")
		job.exp = job_data.get("job_exp")
		job.max_exp = job_data.get("job_max_exp")

	for job in market:
		var job_data: Dictionary = SaveLoad.load_data(job.job_title, ["job_salary", "job_level", "job_exp", "job_max_exp"])
		job.salary = job_data.get("job_salary")
		job.level = job_data.get("job_level")
		job.exp = job_data.get("job_exp")
		job.max_exp = job_data.get("job_max_exp")

	for job in masonry:
		var job_data: Dictionary = SaveLoad.load_data(job.job_title, ["job_salary", "job_level", "job_exp", "job_max_exp"])
		job.salary = job_data.get("job_salary")
		job.level = job_data.get("job_level")
		job.exp = job_data.get("job_exp")
		job.max_exp = job_data.get("job_max_exp")

	for job in monastery:
		var job_data: Dictionary = SaveLoad.load_data(job.job_title, ["job_salary", "job_level", "job_exp", "job_max_exp"])
		job.salary = job_data.get("job_salary")
		job.level = job_data.get("job_level")
		job.exp = job_data.get("job_exp")
		job.max_exp = job_data.get("job_max_exp")

	for job in slave_quarters:
		var job_data: Dictionary = SaveLoad.load_data(job.job_title, ["job_salary", "job_level", "job_exp", "job_max_exp"])
		job.salary = job_data.get("job_salary")
		job.level = job_data.get("job_level")
		job.exp = job_data.get("job_exp")
		job.max_exp = job_data.get("job_max_exp")
