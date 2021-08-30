extends Area2D

func _on_Hub_to_Meadow_Collider_body_exited(body):
	if body.name == "PlayerCharacter":
		if body.position.y > self.position.y:
			get_node("../Camera2D").move_to("Meadow")
		else:
			get_node("../Camera2D").move_to("Hub")

func _on_Hub_to_Ruins_Collider_body_exited(body):
	if body.name == "PlayerCharacter":
		if body.position.x > self.position.x:
			get_node("../Camera2D").move_to("Ruins")
		else:
			get_node("../Camera2D").move_to("Hub")

func _on_Hub_to_Swamp_Collider_body_exited(body):
	if body.name == "PlayerCharacter":
		if body.position.x > self.position.x:
			get_node("../Camera2D").move_to("Swamp")
		else:
			get_node("../Camera2D").move_to("Hub")
