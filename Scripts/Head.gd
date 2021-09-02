extends AnimatedSprite

var projectile_scene = load("res://Scenes/Dragon/Projectile.tscn")
export var target_location: NodePath

var done = true

var point = 1
var leftwards = ["Left centre to left",
				 "Right centre to left centre",
				 "Right to right centre"]
var rightwards = ["Left to left centre",
				  "Left centre to right centre",
				  "Right centre to right"]
var rng = RandomNumberGenerator.new()
var index = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	index = int(name[-1]) # Nodes named Head + index

# Use this turn to fire

func fire():
	done = false
	move_to(1, funcref(self, "fire_b"))

# Triggered when the head is pointing in the right direction

func fire_b():
	$"Head sounds".scream()
	play("Attack A")
	yield(self, "animation_finished")
	get_node("../Warning" + str(index)).play("Activate")
	yield(get_node("../Warning" + str(index)), "animation_finished")
	var bullet = projectile_scene.instance()
	bullet.scale.x = 3
	bullet.scale.y = 3
	bullet.set_target(get_node(target_location))
	bullet.parent = self
	add_child(bullet)
	play("Attack B")
	yield(self, "animation_finished")
	done = true

# Use this turn idly

func idle():
	done = false
	move_to(rng.randi_range(0, 3), funcref(self, "idle_b"))

func idle_b():
	done = true

# Move to a point during this turn

func move_to(target, return_f):
	if point == target:
		return_f.call_func()
	else:
		if target > point:
			play(rightwards[point])
			yield(self, "animation_finished")
			point = point + 1
		else:
			play(leftwards[point-1])
			yield(self, "animation_finished")
			point = point - 1
		move_to(target, return_f)

# Visual & sound cues for a hit going through

func hurt():
	$"Head sounds".hurt()
	for x in range(2):
		self_modulate = Color.lightcoral
		yield(get_tree().create_timer(0.2), "timeout")
		self_modulate = Color.white
		yield(get_tree().create_timer(0.2), "timeout")

