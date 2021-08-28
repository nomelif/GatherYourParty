extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()
export var lower_bound = 4
export var upper_bound = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	while true:
		yield(get_tree().create_timer(rng.randf_range(lower_bound, upper_bound)), "timeout")
		play(0)
		yield(get_tree().create_timer(self.stream.get_length()), "timeout")
		stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
