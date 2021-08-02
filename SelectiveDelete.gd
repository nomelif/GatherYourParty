extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(String) var required_character;
export(Array) var success_dialogue;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_body_entered(body):
	if body.name == "PlayerCharacter":
		if body.front_peep() == required_character:
			body.queue_animations(success_dialogue)
			body.queue_animations([[null, funcref(self, "delete_sprite")]])
		elif body.has_peep(required_character):
			body.queue_animations([["../../" + required_character + "Bubble", "Creation"],
								   ["../../" + required_character + "Bubble", "Exclamation"],
								   ["../../" + required_character + "Bubble", "Press X"],
								   ["../../" + required_character + "Bubble", "Deletion"]])
		else:
			body.queue_animations([["../../FighterBubble", "Creation"],
								   ["../../FighterBubble", "Annoyed"],
								   ["../../FighterBubble", "Deletion"]])

func delete_sprite():
	self.get_parent().remove_child(self)


func _on_animation_finished():
	pass # Replace with function body.
