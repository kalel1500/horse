extends Label
class_name ScoreNumber

var score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_score(Storage.getData("score"))
	update_score_text()
	update_slider_value()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func get_score() -> int:
	return self.score

func set_score(newSocre: int):
	self.score = newSocre

func update_score_text():
	self.text = str(self.score)

func update_slider_value():
	$"../../../ResultSlider".value = self.score


func _on_btn_sum_pressed():
	var new_score = self.score + 1
	set_score(new_score)
	update_score_text()
	update_slider_value()
	
