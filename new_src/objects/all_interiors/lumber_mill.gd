extends Interior

var job_list: Array[Job]
@onready var job_list_container: VBoxContainer = $interior/VBoxContainer/job_list/ScrollContainer/VBoxContainer

const CONTAINER = preload("res://new_src/objects/job_list_item/container.tscn")

func _ready() -> void:
	if job_manager.has_method("give_list"):
		job_list = job_manager.give_list(self.name)
	
	if job_list:
		for job in job_list:
			var job_item_instance = CONTAINER.instantiate()
			job_item_instance.job = job
			job_list_container.add_child(job_item_instance)
			if job_item_instance.has_signal('get_job'):
				job_item_instance.get_job.connect(send_to_manager)
		
	

func send_to_manager(job_rsc: Job):
	if job_manager.has_method('job_transfer'):
		job_manager.job_transfer(job_rsc)
