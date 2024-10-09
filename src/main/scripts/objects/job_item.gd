extends MarginContainer

signal get_job(job_rsc)

@export var job: Job

@onready var display_icon: TextureRect = $HBoxContainer/job_icon
@onready var display_title: Label = $HBoxContainer/VBoxContainer/job_title
@onready var display_salary: Label = $HBoxContainer/VBoxContainer2/salary
@onready var display_bar: ProgressBar = $HBoxContainer/VBoxContainer/ProgressBar
@onready var display_level: Label = $HBoxContainer/VBoxContainer2/level

func _ready() -> void:
	display_icon.texture = job.icon
	display_title.text = job.job_title
	display_salary.text = "Salary: " + str(job.salary)
	display_bar.max_value = job.max_exp
	display_bar.value = job.exp
	display_level.text = "Level: " + str(job.level)


func _on_button_button_up() -> void:
	emit_signal("get_job", job)


func _on_timer_timeout() -> void:
	display_salary.text = "Salary: " + str(job.salary)
	display_bar.max_value = job.max_exp
	display_bar.value = job.exp
	display_level.text = "Level: " + str(job.level)
