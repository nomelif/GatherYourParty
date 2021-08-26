extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()

func hurt():
	if get_node("/root/Node2D/Node2D2/PlayArea/Black").visible:
		return
	get_node("hurt" + str(rng.randi_range(1, 10))).play()

func scream():
	if get_node("/root/Node2D/Node2D2/PlayArea/Black").visible:
		return
	$scream.play()
	yield(get_tree().create_timer(0.96), "timeout")
	$scream.stop()
