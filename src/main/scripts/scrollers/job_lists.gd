extends Node

signal get_job(job_rcs)

@export var job_list: Array[Job]

@onready var interior_manager: Node = $"../../../.."
const JOB_ITEM = preload("res://src/main/objects/job_item.tscn")
@onready var h_box_container: VBoxContainer = $HBoxContainer/ScrollContainer/VBoxContainer

func _ready() -> void:
	for job in job_list:
		var item_instance = JOB_ITEM.instantiate()
		
		item_instance.get_job.connect(job_transfer)
		
		item_instance.job = job
		h_box_container.add_child(item_instance)

func job_transfer(job_rsc: Job) -> void:
	emit_signal("get_job", job_rsc)
	
