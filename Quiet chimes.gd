extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	while true:
		yield(get_tree().create_timer(rng.randf_range(4, 20)), "timeout")
		play(0)
		yield(get_tree().create_timer(53.78), "timeout")
		stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
