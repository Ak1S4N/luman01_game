extends MarginContainer

signal get_job(job_rsc)

@export var job: Job

@onready var display_title: Label = $HBoxContainer/VBoxContainer/HBoxContainer/job_name
@onready var display_salary: Label = $HBoxContainer/VBoxContainer/HBoxContainer3/salary
@onready var display_bar: ProgressBar = $HBoxContainer/VBoxContainer/HBoxContainer2/ProgressBar
@onready var display_level: Label = $HBoxContainer/VBoxContainer/HBoxContainer2/job_level
@onready var display_req: Label = $HBoxContainer/VBoxContainer/HBoxContainer3/requirements

func _ready() -> void:
	display_title.text = str(job.job_title)
	display_salary.text = "Salary: " + str(job.salary)
	display_bar.max_value = job.max_exp
	display_bar.value = job.exp
	display_level.text = "Level: " + str(job.level)
	if job.job_required:
		display_req.text = str(job.job_required.job_title) + " Level: " + str(job.jr_level_required)
	


func _on_apply_button_up() -> void:
	if job.job_required:
		if job.job_required.level >= job.jr_level_required:
			emit_signal("get_job", job)
	else:
		emit_signal("get_job", job)


func _on_timer_timeout() -> void:
	if not GameSettings.paused and not GameSettings.on_event:
		display_salary.text = "Salary: " + str(job.salary)
		display_bar.max_value = job.max_exp
		display_bar.value = job.exp
		display_level.text = "Level: " + str(job.level)
