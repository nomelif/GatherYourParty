extends Area2D

func _on_Hit_body_entered(body):
	if body.name == "Projectile":
		body.get_parent().remove_child(body)
