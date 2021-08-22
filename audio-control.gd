extends AudioStreamPlayer2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var loop: bool = false
export var randomize_start: bool = false
var last_pos = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("finished", self, "_on_finished")
	if randomize_start:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		self.play(rng.randf_range(0, stream.get_length()))
	else:
		self.play()

# Catch when the audio loops (there seems to be no signal to do this)

func _process(delta):
	var cur_pos = self.get_playback_position()
	if cur_pos < last_pos:
		logic(true)
	last_pos = cur_pos

# Catch when the audio ends

func _on_finished():
	logic(false)

# What to do at the end of the file

func logic(caught_by_loop_test):
	if loop and caught_by_loop_test:
		pass
	else:
		if loop:
			self.play()
		else:
			self.stop()
