extends Label
class_name TimeNumber

var time: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var getTime = Storage.getData("time")
	self.time = getTime
	self.text = str(getTime)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_time() -> int:
	return self.time

func _on_timer_timeout():
	self.time = self.time+1
	self.text = str(self.time)
