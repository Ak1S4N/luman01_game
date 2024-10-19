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
	

func _on_timer_timeout() -> void:
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