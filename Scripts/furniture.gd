extends Sprite2D

var is_anormal: bool = false
@export var resource: FurnitureResource = null
var original_texture: Texture2D = null

func _ready():
	$Area2D.scale = Vector2(resource.size,resource.size)
	original_texture = texture

func reset():
	texture = original_texture
	$Area2D/CollisionShape2D.disabled = true
	self_modulate.a = 255
	GAME.anomal_removed(self)
	is_anormal = false

func anomaly():
	is_anormal = true
	while true:
		$Area2D/CollisionShape2D.disabled = false
		var x = randf()
		if resource.disappear and x < 0.15:
			self_modulate.a = 0
			return 0
		elif resource.movement and x >= 0.15 and x <= 0.25 :
			global_position = resource.movement_position
			return 0
		elif resource.change and x > 0.25:
			var r_texture = randi_range(1,resource.number_changes)
			if r_texture == 1:
				texture = resource.texture_1
			if r_texture == 2:
				texture = resource.texture_2
			if r_texture == 3:
				texture = resource.texture_3
			return 0
