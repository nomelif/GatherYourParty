extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_body_entered(body):
	if body.name == "PlayerCharacter":
		if body.people_qty == 4:
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


func _on_animation_finished():
	pass # Replace with function body.
