extends Resource
class_name Event

@export var event_title: String
@export_multiline var event_description: String

@export var has_occured: bool = false

@export_enum("gives_job", "gives_value") var type: int
@export_enum('option1', 'option2') var option: int

#leave variables below empty if event type not applicable
@export var job_options: Array[Job]
@export var value_options: Array[int]
@export var value_name: Array[String]
