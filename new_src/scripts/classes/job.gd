extends Resource
class_name Job

@export_multiline var job_title: String = ""
@export var salary: int
@export var level: int
@export_range(0.0,1.0) var psi_perle: float #percent salary increase per level

@export var exp: float
@export var max_exp: float
@export_range(0.0,1.0) var pmei_perle: float #percent max exp increase per level 

#This below section is now for 'requirements'
@export var job_required: Job
@export var jr_level_required: int #JR is Job Required
@export_enum('None', 'Tools', 'Stave', 'Sling') var item_required: int

@export var job_condition: int
