extends AudioStreamPlayer2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var loop: bool = false
export var randomize_start: bool = false
export var delay = 0
var last_pos = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("finished", self, "_on_finished")
	if randomize_start:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		if stream != null: # This apparently can happen
			var k = rng.randf_range(0, stream.get_length() + delay)
			if k > stream.get_length():
				yield(get_tree().create_timer(delay - (k - stream.get_length())), "timeout")
				self.play()
			else:
				self.play(rng.randf_range(0, stream.get_length()))
		else:
			self.play()
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
		if delay == 0:
			pass
		else:
			self.stop()
			yield(get_tree().create_timer(delay), "timeout")
			self.play(0)
	else:
		if loop:
			yield(get_tree().create_timer(delay), "timeout")
			self.play()
		else:
			self.stop()
