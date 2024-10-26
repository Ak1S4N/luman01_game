extends Managers

var income: int
var expenses: int
var wallet: int = 0

@export var current_job: Job
@onready var character_manager: Node = $character_manager
@export var job_manager: Managers


func _ready() -> void:
	if job_manager:
		job_manager.get_job.connect(job_transfer)
	
	if SaveLoad.is_new_game == false:
		load_data()

func _on_timer_timeout() -> void:
	if not GameSettings.paused and not GameSettings.on_event:
		var jeg = character_manager.job_exp_gain
		income = current_job.salary
		wallet += current_job.salary
		current_job.exp += jeg
		
		if current_job.exp >= current_job.max_exp:
			var add_max_exp = (current_job.max_exp * current_job.pmei_perle)
			var add_salary = (current_job.salary * current_job.psi_perle)
			
			current_job.salary += add_salary
			current_job.max_exp += add_max_exp
			current_job.level += 1
			current_job.exp = 0

func job_transfer(job_rsc: Job) -> void:
	current_job = job_rsc

func add_exp(value: int) -> void:
	current_job.exp += value


func save() -> void:
	var character_name = "player"
	var character_data: Dictionary = {
		"current_job": current_job,
		"wallet": wallet,
		"age": character_manager.age,
		"day": character_manager.day
		}
	
	SaveLoad.save(character_data, character_name)
	

func load_data() -> void:
	var data_dict: Dictionary = SaveLoad.load_data("player", ["current_job", "wallet"])
	current_job = data_dict.get("current_job")
	wallet = data_dict.get("wallet")
	
