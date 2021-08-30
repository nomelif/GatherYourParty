extends AudioStreamPlayer

var rng = RandomNumberGenerator.new()
export var lower_bound = 4
export var upper_bound = 20

func _ready():
	rng.randomize()
	while true:
		yield(get_tree().create_timer(rng.randf_range(lower_bound, upper_bound)), "timeout")
		play(0)
		yield(get_tree().create_timer(self.stream.get_length()), "timeout")
		stop()
