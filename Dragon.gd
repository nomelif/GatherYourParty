extends Node2D

var rng = RandomNumberGenerator.new()
var state = {"Tail":"down",
			 "Head":"left",
			 "Head2":"left",
			 "Head3":"left",
			 "Head4":"left"}

var timers = {"Tail": null,
			  "Head": null,
			  "Head2": null,
			  "Head3": null,
			  "Head4": null}

#	timer = Timer.new()
#	timer.connect("timeout",self,"_on_timer_timeout")
#	timer.set_wait_time(rng.randf_range(2, 3))
#	add_child(timer)
#	connect("animation_finished", self, "_stop")
#	timer.start()

var transitions = {
	"Tail": {
		"down": [["Down to up", 1.0]],
		"up": [["Up to down", 1.0]]
	},
	"Head": {
		"left": [["Left to left centre", 0.8],
				 ["Left blink", 0.2]],
		"left centre": [["Left centre to left", 0.4],
						["Left centre to right centre", 0.4],
						["Left centre blink", 0.2]],
		"right centre": [["Right centre to right", 0.4],
						 ["Right centre to left centre", 0.4],
						 ["Right centre blink", 0.2]],
		"right": [["Right to right centre", 0.8],
				  ["Right blink", 0.2]]
	}
}

var animation_finish_transition = {
	"Tail": {
		"Down to up": "up",
		"Up to down": "down"
	},
	"Head": {
		"Left to left centre": "left centre",
		"Left centre to left": "left",
		"Left centre to right centre": "right centre",
		"Right centre to left centre": "left centre",
		"Right centre to right": "right",
		"Right to right centre": "right centre",
		"Left blink": "left",
		"Left centre blink": "left centre",
		"Right centre blink": "right centre",
		"Right blink": "right"
	}
}

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	
	for timer in timers.keys():
		timers[timer] = Timer.new()
		add_child(timers[timer])
		timers[timer].connect("timeout", self, "_on_" + timer + "_timeout")
	
	
	play_next("Tail", "")
	play_next("Head", "")
	play_next("Head", "2")
	play_next("Head", "3")
	play_next("Head", "4")
	
# Whenever an animation finishes, queue a random connected one

func play_next(node, index):
	#timers[node+index] = Timer.new()
	#add_child(timers[node + index])
	#timers[node + index].connect("timeout", self, "_on_" + node + index + "_timeout")
	timers[node+index].set_wait_time(rng.randf_range(0.5, 1.0))
	timers[node+index].start()
	
func play_next_b(node, index):
	#remove_child(timers[node+index])
	if state[node+index] in animation_finish_transition[node]:
		state[node+index] = animation_finish_transition[node][state[node+index]]
	var total_probability = 0
	for transition in transitions[node][state[node+index]]:
		total_probability += transition[1]
	var k = rng.randf_range(0, total_probability)
	var c = 0
	for i in range(0, len(transitions[node][state[node+index]])):
		c += transitions[node][state[node+index]][i][1]
		if c > k:
			state[node+index] = transitions[node][state[node+index]][i-1][0]
			break
	get_node(node+index).play(state[node+index])

func _on_Head2_animation_finished():
	play_next("Head", "2")


func _on_Head3_animation_finished():
	play_next("Head", "3")


func _on_Head4_animation_finished():
	play_next("Head", "4")


func _on_Head_animation_finished():
	play_next("Head", "")


func _on_Tail_animation_finished():
	play_next("Tail", "")

func _on_Tail_timeout():
	play_next_b("Tail", "")

func _on_Head_timeout():
	play_next_b("Head", "")

func _on_Head2_timeout():
	play_next_b("Head", "2")

func _on_Head3_timeout():
	play_next_b("Head", "3")

func _on_Head4_timeout():
	play_next_b("Head", "4")
