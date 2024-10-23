extends Node

var config = ConfigFile.new()

var is_new_game: bool = true

func save(datas: Dictionary, data_name: String) -> void:
	print('game saved!')
	var data_key_strings = datas.keys()
	for i in data_key_strings:
		config.set_value(data_name, i, datas[i])
		config.save("res://savefile.cfg")
	

func load_data(data_name: String, data_needed: Array[String]):
	var save_file = config.load("res://savefile.cfg")
	if save_file == OK:
		var data_dict = {}
		for i in data_needed:
			var data = config.get_value(data_name, i)
			data_dict[i] = data
		return data_dict
	
	print('game loading')