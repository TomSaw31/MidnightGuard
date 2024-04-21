extends Sprite2D

var is_anormal: bool = false
@export var resource: FurnitureResource = null

func _ready():
	$Area2D.scale = Vector2(resource.size,resource.size)

func anomaly():
	is_anormal = true
	while true:
		var x = randf()
		if resource.disappear and x < 0.15:
			visible = false
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
