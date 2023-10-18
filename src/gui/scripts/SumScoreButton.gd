extends Button
class_name SumScoreButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.s
func _process(delta):
	pass

func _on_button_down():
	sum_points()



func sum_points():
	var labelPoints = $"../Data/Score/ScoreNumber"
	var points = int(labelPoints.text)
	var newPoints = points+1
	labelPoints.text = str(newPoints)
	
	var slider = $"../ResultSlider"
	slider.value = newPoints
