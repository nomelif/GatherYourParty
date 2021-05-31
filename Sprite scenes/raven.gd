extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer
var rng = RandomNumberGenerator.new()
var flippiness = false
var state = "left"
var transitions = {
	"left": ["turn_right", "turn_right", "left", "left", "blink_left", "blink_left", "blink_left", "flap"],
	"right": ["turn_left", "turn_left", "right", "right", "blink_right", "blink_right", "blink_right"]
}

var animation_finish_transition = {
	"turn_right": "right",
	"turn_left": "left",
	"blink_right": "right",
	"blink_left": "left",
	"flap": "left"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	if rng.randi_range(0, 1) == 0:
		set_flip_h(true)
		$Eyes.set_flip_h(true)
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	timer.set_wait_time(rng.randf_range(2, 3))
	add_child(timer)
	connect("animation_finished", self, "_stop")
	timer.start()

func _on_timer_timeout():
	if state in transitions.keys():
		state = transitions[state][rng.randi_range(0, len(transitions[state])-1)]
		play(state)
		$Eyes.play(state)
	
func _stop():
	if state in animation_finish_transition.keys():
		play(animation_finish_transition[state])
		$Eyes.play(animation_finish_transition[state])
		state = animation_finish_transition[state]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
