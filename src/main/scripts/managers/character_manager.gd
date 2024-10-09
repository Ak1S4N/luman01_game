extends Managers


@export var current_items: Array[Item]

var job_exp_gain: float = 1
var skill_exp_gain: float = 1

func use_current_item() -> void:
	var overall_add: float
	if current_items:
		for i in current_items:
			var val = i.value
			var type = i.item_type #this return an int = {0, 1, 2, 3, ...}
			
			match type:
				0:
					job_exp_gain = (val * job_exp_gain) 
				1:
					skill_exp_gain = (val * skill_exp_gain)
	

func replace_used_item(new_item: Item) -> void:
	var type = new_item.item_type
	match type:
		0:
			for i in current_items:
				if i.item_type == 0:
					current_items.erase(i)
					current_items.append(new_item)
		1:
			for i in current_items:
				if i.item_type == 1:
					current_items.erase(i)
					current_items.append(new_item)


func _on_timer_timeout() -> void:
	use_current_item()
