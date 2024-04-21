extends Control

const BATTERY_2 = preload("res://Assets/Textures/UI/battery2.png")
const BATTERY_1 = preload("res://Assets/Textures/UI/battery1.png")
const BATTERY_0 = preload("res://Assets/Textures/UI/battery0.png")

@onready var battery_texture: TextureRect = $Battery
@onready var hour_text: Label = $Hour
var battery: int = 3
var left_button_hovered: bool = false
var right_button_hovered: bool = false

func _process(_delta):
	if GAME.timer != null:
		hour_text.text = _convert_time(360.0-floor(GAME.timer.time_left))

func decrease_battery():
	battery -= 1
	if battery == 2:
		battery_texture.texture = BATTERY_2
	elif battery == 1:
		battery_texture.texture = BATTERY_1
	else:
		print("Perdu")


func _physics_process(_delta):
	if right_button_hovered:
		owner.move_player(1)
	if left_button_hovered:
		owner.move_player(-1)

func _convert_time(time: int):
	return "%02d:%02d" % [(time/60)%60,time%60]

func _on_button_right_mouse_entered():
	right_button_hovered = true


func _on_button_right_mouse_exited():
	right_button_hovered = false


func _on_button_left_mouse_entered():
	left_button_hovered = true


func _on_button_left_mouse_exited():
	left_button_hovered = false
