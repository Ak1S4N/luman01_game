extends Resource
class_name ConditionsMet

var conditions_met: Dictionary = {
	"event_conditions": [],
	"item_conditions": [],
	"job_conditions": [],
	"character_conditions": []
}

func append_condition(condition_type: String, condition_id: String) -> void:
	var conditions = conditions_met.keys()
	for c in conditions:
		if !conditions_met[c].has(condition_id):
			if condition_type == c\
			and !conditions_met[c].has(condition_id):
				conditions_met[c].append(condition_id)
	print(conditions_met)
