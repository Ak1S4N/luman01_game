extends Managers

@onready var wallet_label: Label = $status/VBoxContainer/financial_bar/HBoxContainer/VBoxContainer/wallet_label
@onready var job_label: Label = $status/VBoxContainer/financial_bar/HBoxContainer/VBoxContainer2/job_label
@onready var job_exp: ProgressBar = $status/VBoxContainer/financial_bar/HBoxContainer/VBoxContainer2/job_exp
@onready var salary_label: Label = $status/VBoxContainer/financial_bar/HBoxContainer/VBoxContainer/salary_label
@onready var jl_label: Label = $status/VBoxContainer/financial_bar/HBoxContainer/VBoxContainer2/jl_label

@onready var finance_manager: Node = $"../../finance_manager"

func _process(delta: float) -> void:
	wallet_label.text = str(finance_manager.wallet)
	job_label.text = str(finance_manager.current_job.job_title)
	salary_label.text = str(finance_manager.current_job.salary)
	jl_label.text = str(finance_manager.current_job.level)
	
	job_exp.max_value = finance_manager.current_job.max_exp
	job_exp.value = finance_manager.current_job.exp
	
