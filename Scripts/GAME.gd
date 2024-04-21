extends Node

const SPAWN_RATE = 5
var amount_anomalies: int = 0
var max_anomalies: int = 0
var furnitures = []
var anomaly_spawned: bool = false
var timer: Timer

func _ready():
	furnitures = get_tree().get_nodes_in_group("anomaly")
	max_anomalies = len(furnitures)
	start_game()

func add_anomaly():
	if len(furnitures) > 0:
		var anomaly = furnitures.pick_random()
		furnitures.erase(anomaly)
		print(len(furnitures))
		anomaly.anomaly()

func _process(_delta):
	if timer != null:
		var time_left: int = 360-floor(timer.time_left)
		if (time_left % SPAWN_RATE) == 0:
			if anomaly_spawned == false:
				anomaly_spawned = true
				add_anomaly()
		else:
			anomaly_spawned = false

func start_game():
	timer = Timer.new()
	add_child(timer)
	timer.start(360)
