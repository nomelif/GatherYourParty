extends Area2D

func _on_Area2D_body_entered(body):
	if body.name == "PlayerCharacter" && visible:
		body.queue_animations([["../../"+body.front_peep()+"Bubble", "Creation"],
							   ["../../"+body.front_peep()+"Bubble", "Exclamation"],
							   ["../../"+body.front_peep()+"Bubble", "Deletion"],
							   [null, funcref(self, "post_animation")]])

func post_animation():
	$AudioStreamPlayer2D.play()
	visible = false
	yield(get_tree().create_timer(8.333), "timeout")
	self.get_parent().remove_child(self)
