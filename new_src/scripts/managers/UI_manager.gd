extends Managers

@onready var wallet_label: Label = $status/VBoxContainer/finance_bar/HBoxContainer/VBoxContainer/wallet_label
@onready var job_label: Label = $status/VBoxContainer/finance_bar/HBoxContainer/VBoxContainer2/job_label
@onready var job_exp: ProgressBar = $status/VBoxContainer/finance_bar/HBoxContainer/VBoxContainer2/job_exp
@onready var salary_label: Label = $status/VBoxContainer/finance_bar/HBoxContainer/VBoxContainer/salary_label
@onready var jl_label: Label = $status/VBoxContainer/finance_bar/HBoxContainer/VBoxContainer2/jl_label

@onready var open_char_stat: Button = $open_char_stat
@onready var status: Panel = $status

@export var finance_manager: Managers

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("toggle_character_stats"):
		toggle_character_stats(!status.visible)

func _process(delta: float) -> void:
	wallet_label.text = str(finance_manager.wallet)
	job_label.text = str(finance_manager.current_job.job_title)
	salary_label.text = str(finance_manager.current_job.salary)
	jl_label.text = str(finance_manager.current_job.level)
	
	job_exp.max_value = finance_manager.current_job.max_exp
	job_exp.value = finance_manager.current_job.exp
	

func toggle_character_stats(toggle: bool) -> void:
	open_char_stat.visible = !toggle
	status.visible = toggle


func _on_open_char_stat_button_up() -> void:
	toggle_character_stats(true)


func _on_exit_char_stat_button_up() -> void:
	toggle_character_stats(false)
