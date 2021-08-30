extends AudioStreamPlayer2D

var last_pos = -1

# Catch when the audio loops (there seems to be no signal to do this)

func _process(delta):
	var cur_pos = self.get_playback_position()
	if cur_pos < last_pos:
		stop()
		seek(0)
		last_pos = -1
	else:
		last_pos = cur_pos
