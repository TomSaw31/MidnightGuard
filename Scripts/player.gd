extends Node2D

@onready var cursor = $Cursor

func _input(event):
	if event.is_action_pressed("ui_down"):
		GAME.add_anomaly()

func _physics_process(_delta):
	cursor.global_position = get_global_mouse_position()

func move_player(n :int):
	position.x += n
	position.x = clamp(position.x, -356,356)
