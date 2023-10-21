extends Control

@onready var godot_icon = $SumPanel/VerticalItems/GodotIcon
@onready var time_number = $SumPanel/VerticalItems/Data/Time/TimeNumber
@onready var score_number = $SumPanel/VerticalItems/Data/Score/ScoreNumber
@onready var result_slider = $SumPanel/VerticalItems/ResultSlider
@onready var btn_save = $SumPanel/VerticalItems/BtnSave
@onready var btn_sum = $SumPanel/VerticalItems/BtnSum
@onready var timer = $Timer

var time: int = 0
var score: int = 0
var is_saved: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.time = Storage.getData("time")
	time_number.text = str(self.time)

	self.score = Storage.getData("score")
	score_number.text = str(self.score)
	result_slider.value = self.score

	timer.timeout.connect(_on_timer_timeout)
	btn_sum.pressed.connect(_on_btn_sum_pressed)
	btn_save.pressed.connect(_on_btn_save_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if godot_icon.visible:
		godot_icon.hide()
	else:
		godot_icon.show()

	self.time = self.time+1
	time_number.text = str(self.time)

func _on_btn_sum_pressed():
	self.score = self.score + 1
	score_number.text = str(self.score)
	result_slider.value = self.score

	self.is_saved = false
	checkDisabled()

func _on_btn_save_pressed():
	Storage.setData("score", self.score)
	Storage.setData("time", self.time)
	Storage.save_data()
	self.is_saved = true
	checkDisabled()



func checkDisabled():
	if self.is_saved:
		btn_save.disabled = true
	else:
		btn_save.disabled = false

