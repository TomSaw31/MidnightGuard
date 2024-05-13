extends Sprite2D

var is_anormal: bool = false
@export var default_texture: Texture2D = null
@export var size: float = 1
@export var disappear: bool = false
@export var change: bool = true
@export var number_changes: int = 1
@export var texture_1: Texture2D = null
@export var texture_2: Texture2D = null
@export var texture_3: Texture2D = null
@export var movement: bool = false
@export var movement_position: Vector2 = Vector2.ZERO
@export var symetry: bool = false
@export var furniture_name: String = ""

func _ready():
	$Area2D.scale = Vector2(size,size)

func reset():
	flip_h = false
	texture = default_texture
	$Area2D/CollisionShape2D.disabled = true
	self_modulate.a = 255
	GAME.anomal_removed(self)
	is_anormal = false

func anomaly():
	is_anormal = true
	while true:
		$Area2D/CollisionShape2D.disabled = false
		var x = randf()
		if disappear and x < 0.15:
			self_modulate.a = 0
			return 0
		elif movement and x >= 0.15 and x <= 0.25 :
			global_position = movement_position
			return 0
		elif symetry and x > 0.25 and x <= 0.35:
			flip_h = true
		elif change and x > 0.35:
			var r_texture = randi_range(1,number_changes)
			if r_texture == 1:
				texture = texture_1
			if r_texture == 2:
				texture = texture_2
			if r_texture == 3:
				texture = texture_3
			return 0
