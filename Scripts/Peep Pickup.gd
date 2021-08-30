extends Area2D


export(String) var character;
export(Array) var dialogue = [];
var player = null

func _on_body_entered(body):
	if body.name == "PlayerCharacter" && visible:
		body.queue_animations(dialogue)
		player = body
		body.queue_animations([[null, funcref(self, "cleanup")]])

func cleanup():
	player.people_qty += 1
	get_node('../'+character+'Sprite').visible = true
	player.cutscene = false
	$AudioStreamPlayer2D.play()
	visible = false
	yield(get_tree().create_timer(4.261), "timeout")
	get_parent().remove_child(self)
