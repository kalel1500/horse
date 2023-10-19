extends Node

const SAVEFILE = "user://SAVEFILE.save"

var game_data = {
	"score": 0,
	"time": 0
}

func _ready():
	load_data()

func load_data():
	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	if file == null:
		save_data()
	else:
		game_data = file.get_var()
	file = null

func save_data():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE)
	file.store_var(game_data)
	file = null

func getData(key: String):
	return game_data[key]

func setData(key: String, value):
	game_data[key] = value

func save(key: String, value):
	game_data[key] = value
	save_data()


func _test_pr():
	print('a')
