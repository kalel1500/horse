extends Node

const SAVEFILE = "user://SAVEFILE.save"

var game_score = 0
var game_time = 0

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
	game_score = game_data.score
	game_time = game_data.time

func save_data():
	game_data.score = game_score
	game_data.time = game_time
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE)
	file.store_var(game_data)
	file = null


func getScore() -> int:
	return game_score

func setScore(value: int) -> void:
	game_score = value

func getTime() -> int:
	return game_time

func setTime(value: int) -> void:
	game_time = value

func deleteGameData() -> void:
	game_data.score = 0
	game_data.time = 0
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE)
	file.store_var(game_data)
	file = null
