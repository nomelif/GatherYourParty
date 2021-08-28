extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer = Timer.new()
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	add_child(timer)
	timer.connect("timeout", self, "_on_timeout")
	trigger_timer()

func trigger_timer():
	timer.set_wait_time(rng.randf_range(0.5, 2.0))
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_timeout():
	if self.animation == "Down to up":
		self.play("Up to down")
	else:
		self.play("Down to up")
	trigger_timer()
