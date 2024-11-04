extends Managers
class_name FinanceManager

var income: int
var total_expenses: int
var wallet: int = 0

@export var current_job: Job
@export var character_manager: CharacterManager
@export var job_manager: Managers
@export var event_manager: EventManager

var _CONDITIONS_MET = preload("res://new_src/resources/conditions_met/ConditionsMet.tres")

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
		wallet -= total_expenses
		
		
		#if character_manager.current_items:
			#for i in character_manager.current_items:
				#if i.price:
					#var expense = i.price
					#wallet -= expense
				
		
		
		if current_job.exp >= current_job.max_exp:
			var add_max_exp = (current_job.max_exp * current_job.pmei_perle)
			var add_salary = (current_job.salary * current_job.psi_perle)
			
			current_job.salary += add_salary
			current_job.max_exp += add_max_exp
			current_job.level += 1
			current_job.exp = 0
	
		if wallet <= 0:
			event_manager.back_to_zero()
			wallet = 0
			total_expenses = 0
	

func job_transfer(job_rsc: Job) -> void:
	current_job = job_rsc
	if job_rsc.job_title:
		_CONDITIONS_MET.conditions_met["job_conditions"].clear()
		_CONDITIONS_MET.append_condition("job_conditions", job_rsc.job_title)
	else:
		print_debug("oops! Job doesn't have condition_id!")

func add_exp(value: int) -> void:
	current_job.exp += value

func add_to_total_expenses(value: int) -> void:
	total_expenses += value

func new_character() -> void:
	wallet = 1



func save() -> void:
	var character_name = "player"
	var character_data: Dictionary = {
		"current_job": current_job,
		"wallet": wallet,
		"name": character_manager.player_name,
		"age": character_manager.age,
		"day": character_manager.day
		}
	
	SaveLoad.save(character_data, character_name)
	

func load_data() -> void:
	var data_dict: Dictionary = SaveLoad.load_data("player", ["current_job", "wallet", "name", "age", "day"])
	current_job = data_dict.get("current_job")
	wallet = data_dict.get("wallet")
