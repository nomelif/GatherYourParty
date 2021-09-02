extends Node2D

var star_scene = load("res://Scenes/Sprite Scenes/Star.tscn")
var rng = RandomNumberGenerator.new()

# Randomly populate area with stars

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
