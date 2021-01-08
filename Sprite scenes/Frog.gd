extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer
var rng = RandomNumberGenerator.new()
var jump_direction = Vector2(0, 0)
var vertical_speed = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	timer.set_wait_time(rng.randf_range(2, 3))
	add_child(timer)
	timer.start()
	$AnimatedSprite.connect("animation_finished", self, "_stop")

func _stop():
	jump_direction = Vector2(0, 0)

func _on_timer_timeout():
	var jump_proposed = Vector2(0, 0)
	while jump_proposed == Vector2(0, 0):
		jump_proposed = Vector2(rng.randf_range(-1, 1), rng.randf_range(-1, 1))
	jump_direction = jump_proposed.normalized()
	vertical_speed = Vector2(0, -2.5)
	$AnimatedSprite.play("jump")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if jump_direction.x >= 0:
		$AnimatedSprite.set_flip_h(true)
	else:
		$AnimatedSprite.set_flip_h(false)
	if jump_direction != Vector2(0, 0):
		vertical_speed += Vector2(0, delta*6)
		move_and_slide(delta * (jump_direction + vertical_speed) * 4000)
		$AnimatedSprite.play("jump")
	else:
		vertical_speed = Vector2(0, 0)
		$AnimatedSprite.play("idle")
