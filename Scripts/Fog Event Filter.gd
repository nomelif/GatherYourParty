extends YSort

# The fog sprites run idle animations. If hooked directly to
# _on_animation_finished(), they'd interfere with other animations

func _on_CollisionlessFog_animation_finished():
	if $CollisionlessFog.animation == "Deletion":
		get_node("../../PlayerCharacter")._on_animation_finished()


func _on_CollisionlessFog2_animation_finished():
	if $CollisionlessFog2.animation == "Deletion":
		get_node("../../PlayerCharacter")._on_animation_finished()


func _on_CollisionlessFog3_animation_finished():
	if $CollisionlessFog3.animation == "Deletion":
		get_node("../../PlayerCharacter")._on_animation_finished()
