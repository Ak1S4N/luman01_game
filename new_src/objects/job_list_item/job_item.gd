extends MarginContainer

signal get_job(job_rsc)
signal show_job_desc(description)
signal hide_job_desc

@export var job: Job
const _CONDITIONS_MET = preload("res://new_src/resources/conditions_met/ConditionsMet.tres")

@onready var display_title: Label = $HBoxContainer/VBoxContainer/HBoxContainer/job_name
@onready var display_salary: Label = $HBoxContainer/VBoxContainer/HBoxContainer3/salary
@onready var display_bar: ProgressBar = $HBoxContainer/VBoxContainer/HBoxContainer2/ProgressBar
@onready var display_level: Label = $HBoxContainer/VBoxContainer/HBoxContainer2/job_level

func _ready() -> void:
	display_title.text = str(job.job_title)
	display_salary.text = "Salary: " + str(job.salary)
	display_bar.max_value = job.max_exp
	display_bar.value = job.exp
	display_level.text = "Level: " + str(job.level)
	


func _on_apply_button_up() -> void:
	var job_item_requirement = job.item_required
	var all_item_types: Array[String]
	var job_title_req = job.title_required
	
	match job_item_requirement:
		"Tools":
			var item_needed: Array = ["Tools", "Quality Tools", "Craftsman Tools"]
			for i in item_needed:
				all_item_types.append(i)
		"Stave":
			var item_needed: Array = ["Stave", "Mace", "Spear", "Sword"]
			for i in item_needed:
				all_item_types.append(i)
		"Sling":
			var item_needed: Array = ["Sling", "Bow", "Longbow"]
			for i in item_needed:
				all_item_types.append(i)
	
	var item_conditions = _CONDITIONS_MET.conditions_met.get("item_conditions")
	
	if job.job_required:
		if (job.job_required.level >= job.jr_level_required):
			if job.item_required != "No item" and job.title_required == "No Requirement":
				for i in all_item_types:
					if i in item_conditions:
						emit_signal("get_job", job)
		
			elif job.item_required != "No item" and job.title_required == "Title Requirement":
				for i in all_item_types:
					if item_conditions.has("Title") and item_conditions.has(i):
						emit_signal("get_job", job)
			
			elif job.item_required == "No item" and job.title_required == "No Requirement":
				emit_signal("get_job", job)
				
			elif job.item_required == "No item" and job.title_required == "Title Requirement":
				if item_conditions.has("Title"):
					emit_signal("get_job", job)
	else:
		if job.item_required != "No item" and job.title_required == "No Requirement":
			for i in all_item_types:
				if i in item_conditions:
					emit_signal("get_job", job)
		
		elif job.item_required != "No item" and job.title_required == "Title Requirement":
			for i in all_item_types:
				if item_conditions.has("Title") and item_conditions.has(i):
					emit_signal("get_job", job)
		
		elif job.item_required == "No item" and job.title_required == "No Requirement":
			emit_signal("get_job", job)
			
		elif job.item_required == "No item" and job.title_required == "Title Requirement":
			if item_conditions.has("Title"):
				emit_signal("get_job", job)
	
	#if job.job_required:
		#if job.job_required.level >= job.jr_level_required:
			#if job.item_required != "No item":
				#for i in all_item_types:
					#if i in _CONDITIONS_MET.conditions_met.get("item_conditions"):
						#emit_signal("get_job", job)
			#else:
				#emit_signal("get_job", job)
	#else:
		#if job.item_required != "No item":
			#for i in all_item_types:
				#if i in _CONDITIONS_MET.conditions_met.get("item_conditions"):
					#emit_signal("get_job", job)
		#else:
			#emit_signal("get_job", job)



func _on_timer_timeout() -> void:
	if not GameSettings.paused and not GameSettings.on_event:
		display_salary.text = "Salary: " + str(job.salary)
		display_bar.max_value = job.max_exp
		display_bar.value = job.exp
		display_level.text = "Level: " + str(job.level)


func _on_apply_mouse_entered() -> void:
	if job.job_required:
		var job_description: String = (
		job.title_required + " needed & " \
		+ job.item_required + " required \n"
		+ job.job_required.job_title + " Level " + str(job.jr_level_required) + " required"
		)
		emit_signal("show_job_desc", job_description)
	else:
		var job_description: String = (
		job.title_required + " needed & \n" 
		+ job.item_required + " required"
		)
		emit_signal("show_job_desc", job_description)


func _on_apply_mouse_exited() -> void:
	emit_signal("hide_job_desc")
