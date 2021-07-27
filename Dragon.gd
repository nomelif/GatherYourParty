extends Node2D

var rng = RandomNumberGenerator.new()
var central_timer = Timer.new()

export var fire_probability = 0.7

func _ready():
	rng.randomize()
	add_child(central_timer)
	central_timer.connect("timeout", self, "next_round")
	next_round()

func next_round():
	print("---")
	if rng.randf_range(0, 1) < fire_probability:
		var firing_head = rng.randi_range(1, 4)
		print("Head" + str(firing_head) + ": firing")
		#get_node("Head" + str(firing_head)).fire()
		for i in range(1, 5):
			if i != firing_head:
				print("Head" + str(i) + ": idling")
				#get_node("Head" + str(i)).idle()
	else:
		for i in range(1, 5):
			print("Head" + str(i) + ": idling")
			#get_node("Head" + str(i)).idle()
	central_timer.set_wait_time(rng.randf_range(0.5, 2.0))
	central_timer.start()
	
