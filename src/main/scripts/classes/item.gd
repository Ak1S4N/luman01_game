extends Resource
class_name Item

@export var item_icon: Texture
@export_multiline var item_name: String
@export var value: float
@export_enum("job_multiplier", "skill_multiplier") var item_type: int
