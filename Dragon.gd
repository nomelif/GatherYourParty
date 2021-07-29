extends Node2D

var rng = RandomNumberGenerator.new()
var central_timer = Timer.new()
var first_round = true

export var fire_probability = 0.7

func _ready():
	rng.randomize()
	add_child(central_timer)
	next_round()

func next_round():
	if rng.randf_range(0, 1) < fire_probability:
		var firing_head = rng.randi_range(1, 4)
		get_node("Head" + str(firing_head)).fire()
		for i in range(1, 5):
			if i != firing_head:
				get_node("Head" + str(i)).idle()
	else:
		for i in range(1, 5):
			get_node("Head" + str(i)).idle()
	var continue_waiting = true
	while continue_waiting:
		yield(get_tree().create_timer(.5), "timeout")
		continue_waiting = false
		for i in range(1, 5):
			if not get_node("Head" + str(i)).done:
				continue_waiting = true
	next_round()
	
