extends AnimatedSprite

export var speed_factor = 1.0

func _on_SpeechBubble_frame_changed():
	if frame == 1:
		get_node("Sounds/"+self.animation).pitch_scale = speed_factor
		get_node("Sounds/"+self.animation).play()
