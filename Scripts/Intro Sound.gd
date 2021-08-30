extends AudioStreamPlayer

# The opening music needs to be cut short

func _process(delta):
	if self.get_playback_position() > 38.333:
		get_parent().remove_child(self)
