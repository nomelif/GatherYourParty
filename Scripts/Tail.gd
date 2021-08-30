extends AnimatedSprite

# Wag tail

var timer = Timer.new()
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	add_child(timer)
	timer.connect("timeout", self, "_on_timeout")
	trigger_timer()

func trigger_timer():
	timer.set_wait_time(rng.randf_range(0.5, 2.0))
	timer.start()

func _on_timeout():
	if self.animation == "Down to up":
		self.play("Up to down")
	else:
		self.play("Down to up")
	trigger_timer()
