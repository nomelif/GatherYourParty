extends AnimatedSprite

func _on_Door_animation_finished():
	if self.animation == "Activation":
		get_tree().change_scene("res://Scenes/Pre Fight.tscn");
