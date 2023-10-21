extends Control

@onready var godot_icon = $SumPanel/VerticalItems/GodotIcon
@onready var time_number = $SumPanel/VerticalItems/Data/Time/TimeNumber
@onready var score_number = $SumPanel/VerticalItems/Data/Score/ScoreNumber
@onready var result_slider = $SumPanel/VerticalItems/ResultSlider
@onready var btn_save = $SumPanel/VerticalItems/BtnSave
@onready var btn_sum = $SumPanel/VerticalItems/BtnSum
@onready var btn_reset = $SumPanel/VerticalItems/BtnReset
@onready var btn_delete = $SumPanel/VerticalItems/BtnDelete
@onready var timer = $Timer

var is_saved: bool = false
var is_reseted: bool = false
var is_deleted: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	update_view_values()

	timer.timeout.connect(_on_timer_timeout)
	btn_sum.pressed.connect(_on_btn_sum_pressed)
	btn_save.pressed.connect(_on_btn_save_pressed)
	btn_reset.pressed.connect(_on_btn_reset_pressed)
	btn_delete.pressed.connect(_on_btn_delete_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_T:
				timer.timeout.emit()
			KEY_P:
				btn_sum.pressed.emit()

func _on_timer_timeout():
	if godot_icon.visible:
		godot_icon.hide()
	else:
		godot_icon.show()

	addOneOnTimer()

func _on_btn_sum_pressed():
	addOneOnScore()
	self.is_saved = false
	self.is_reseted = false
	checkDisabled(self.is_saved, btn_save)
	checkDisabled(self.is_reseted, btn_reset)

func _on_btn_save_pressed():
	Storage.save_data()
	self.is_saved = true
	self.is_deleted = false
	checkDisabled(self.is_saved, btn_save)
	checkDisabled(self.is_deleted, btn_delete)
	print(Storage.game_data)

func _on_btn_reset_pressed():
	Storage.setScore(0)
	Storage.setTime(0)
	update_view_values()
	self.is_reseted = true
	self.is_saved = false
	checkDisabled(self.is_reseted, btn_reset)
	checkDisabled(self.is_saved, btn_save)
	print(Storage.game_data)

func _on_btn_delete_pressed():
	Storage.deleteGameData()
	self.is_deleted = true
	self.is_saved = false
	checkDisabled(self.is_deleted, btn_delete)
	checkDisabled(self.is_saved, btn_save)
	print(Storage.game_data)


func update_view_values():
	showTime(Storage.getTime())
	score_number.text = str(Storage.getScore())
	result_slider.value = Storage.getScore()

func addOneOnScore():
	Storage.setScore(Storage.getScore()+1)
	score_number.text = str(Storage.getScore())
	result_slider.value = Storage.getScore()

func addOneOnTimer():
	var newNumber = 1000
	Storage.setTime(Storage.getTime()+newNumber)
	showTime(Storage.getTime())

func showTime(time_in_sec: int):
	var seconds = time_in_sec%60
	var minutes = (time_in_sec/60)%60
	var hours = (time_in_sec/60)/60
	var time = "%02d:%02d:%02d" % [hours, minutes, seconds]
	time_number.text = time


func checkDisabled(cond: bool, btn: Button):
	if cond:
		btn.disabled = true
	else:
		btn.disabled = false

