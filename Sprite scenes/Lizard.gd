extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	pick_rotation()
	_on_animation_finished()

func pick_rotation():
	self.rotation_degrees = [0, 90, 180, 270][rng.randi_range(0, 3)]

func _on_animation_finished():
	yield(get_tree().create_timer(rng.randf_range(1.0, 1.5)), "timeout")
	frame = 0
	if rng.randf() < 0.1:
		pick_rotation()
	if rng.randf() < 0.5:
		play("Blep")
	else:
		play("Blink")
