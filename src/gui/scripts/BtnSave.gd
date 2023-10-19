extends Button
class_name BtnSave

var isSaved = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_pressed():
	Storage.setData("score", $"../Data/Score/ScoreNumber".get_score())
	Storage.setData("time", $"../Data/Time/TimeNumber".get_time())
	Storage.save_data()
	self.isSaved = true
	checkDisabled()

func checkDisabled():
	if self.isSaved:
		self.disabled = true
	else:
		self.disabled = false


func _on_btn_sum_pressed():
	self.isSaved = false
	checkDisabled()
