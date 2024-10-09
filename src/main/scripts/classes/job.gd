extends Resource
class_name Job

@export var icon: Texture

@export_multiline var job_title: String = ""
@export var salary: int
@export var level: int
@export_range(0.0,1.0) var psi_perle: float #percent salary increase per level

@export var exp: float
@export var max_exp: float
@export_range(0.0,1.0) var pmei_perle: float #percent max exp increase per level 
