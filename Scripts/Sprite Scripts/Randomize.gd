extends AnimatedSprite

func _ready():
	randomize()
	speed_scale = rand_range(0.9, 1.1)
