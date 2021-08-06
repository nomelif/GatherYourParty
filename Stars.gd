extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var star_scene = load("res://Sprite scenes/Star.tscn")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	for x in range(100):
		var star = star_scene.instance()
		star.position.x = rng.randi_range(0, 1024)
		star.position.y = rng.randi_range(0, 600)
		star.position.x -= int(star.position.x) % 4
		star.position.y -= int(star.position.y) % 4
		star.speed_scale = rand_range(0.9, 1.1)
		star.frame = rand_range(0, 16)
		star.modulate = Color(rng.randf_range(0.8, 1.0), rng.randf_range(0.8, 1.0), rng.randf_range(0.8, 1.0))
		add_child(star)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
