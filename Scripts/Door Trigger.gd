extends Area2D

func _on_body_entered(body):
	if body.name == "PlayerCharacter":
		if body.people_qty == 4:
			get_node("../Door/Ghostly sound").play()
			body.queue_animations([["../../FighterBubble", "Exclamation"],
								   ["../../ProtectorBubble", "Exclamation"],
								   ["../../SorceressBubble", "Exclamation"],
								   ["../../HealerBubble", "Exclamation"],
								   ["../Door", "Activation"]])
			body.queue_animations([[null, funcref(self, "delete_sprite")]])
		else:
			body.queue_animations([["../../FighterBubble", "Question"],
								   ["../../FighterBubble", "Door"],
								   ["../../FighterBubble", "No"],
								   ["../../FighterBubble", "Annoyed"],
								   ["../../FighterBubble", "Deletion"]])

func delete_sprite():
	self.get_parent().remove_child(self)
