extends AnimatedSprite

func _on_Warning_animation_finished():
	if self.animation != "Park":
		self.play("Park")
