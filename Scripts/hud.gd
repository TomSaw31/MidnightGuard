extends Control

const BATTERY_2 = preload("res://Assets/Textures/UI/battery2.png")
const BATTERY_1 = preload("res://Assets/Textures/UI/battery1.png")
const BATTERY_0 = preload("res://Assets/Textures/UI/battery0.png")

const ANOMALY_INDICATOR = preload("res://Assets/Textures/UI/anomaly_indicator.png")
const ANOMALY_INDICATOR_0 = preload("res://Assets/Textures/UI/anomaly_indicator_0.png")
const ANOMALY_INDICATOR_1 = preload("res://Assets/Textures/UI/anomaly_indicator_1.png")
const ANOMALY_INDICATOR_2 = preload("res://Assets/Textures/UI/anomaly_indicator_2.png")

@onready var battery_texture: TextureRect = $CameraDisplay/Battery
@onready var anomaly_count_texture: TextureRect = $CameraDisplay/AnomalyIndicator
@onready var hour_text: Label = $CameraDisplay/Hour
var battery: int = 3
var left_button_hovered: bool = false
var right_button_hovered: bool = false
var anomaly_count: int = 0

func _process(delta):
	if GAME.timer != null:
		hour_text.text = _convert_time(360.0-floor(GAME.timer.time_left))
	if right_button_hovered:
		owner.move_player(1,delta)
	if left_button_hovered:
		owner.move_player(-1,delta)
	if GAME.amount_anomalies != anomaly_count:
		anomaly_count = GAME.amount_anomalies
		if anomaly_count == 0:
			anomaly_count_texture.texture = ANOMALY_INDICATOR
		elif anomaly_count <= 2:
			anomaly_count_texture.texture = ANOMALY_INDICATOR_0
		elif anomaly_count <= 4:
			anomaly_count_texture.texture = ANOMALY_INDICATOR_1
		else:
			anomaly_count_texture.texture = ANOMALY_INDICATOR_2
			
func decrease_battery():
	battery -= 1
	if battery == 2:
		battery_texture.texture = BATTERY_2
	elif battery == 1:
		battery_texture.texture = BATTERY_1
	else:
		get_tree().quit()

func _convert_time(time: int):
	return "%02d:%02d" % [(time/60)%60,time%60]


func _on_button_left_button_down():
	left_button_hovered = true


func _on_button_left_button_up():
	left_button_hovered = false


func _on_button_right_button_down():
	right_button_hovered = true


func _on_button_right_button_up():
	right_button_hovered = false


func _on_pause_button_pressed():
	get_tree().quit()


func _on_confirm_button_button_down():
	owner.detect_anomaly()
