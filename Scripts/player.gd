extends Node2D

var speed: int = 150
@onready var cursor = $Cursor
@onready var hud = $CanvasLayer/HUD
@onready var detection_area: Area2D = $Cursor/DetectionArea

func _process(_delta):
	if get_local_mouse_position().y >= 32 and get_local_mouse_position().y <= 48:
		if get_local_mouse_position().x >= -8 and get_local_mouse_position().x <= 8:
			pass
		else:
			cursor.global_position = get_global_mouse_position()
	else:
		cursor.global_position = get_global_mouse_position()

func move_player(n :int, delta: float):
	position.x += n * delta * speed
	position.x = clamp(position.x, -356,356)

func _input(event):
	if event.is_action_pressed("Confirm"):
		detect_anomaly()

func detect_anomaly():
	var anomaly_found = []
	for elem in detection_area.get_overlapping_areas():
		anomaly_found.append(elem)
	if len(anomaly_found) == 0:
		hud.decrease_battery()
	else:
		for anomaly in anomaly_found:
			anomaly.owner.reset()
