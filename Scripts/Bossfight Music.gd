extends AudioStreamPlayer

var fade = false

func _process(delta):
	if fade:
		self.volume_db -= delta * 10
