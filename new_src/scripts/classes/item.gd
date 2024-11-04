extends Resource
class_name Item

@export var item_name: String
@export_multiline var item_description: String
@export var value: float
@export var price: int
@export_enum("constant", "one-time pay") var pay_type: String = "constant"
@export_enum("job_multiplier", "skill_multiplier", "Lords_title") var item_type: int
