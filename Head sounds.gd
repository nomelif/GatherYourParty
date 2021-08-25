extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()

func hurt():
	get_node("hurt" + str(rng.randi_range(1, 10))).play()
