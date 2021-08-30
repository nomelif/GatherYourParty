extends Area2D

export(String) var required_character;
export(Array) var success_dialogue;

var in_body = false

# Don't force the player to walk out and back in upon changing peeps

func _ready():
	get_node("../PlayerCharacter").connect("peeps_changed", self, "logic")

func _on_body_entered(body):
	if body.name == "PlayerCharacter":
		in_body = true
		logic()

func logic():
	if not in_body:
		return
	var body = get_node("../PlayerCharacter")
	if body.front_peep() == required_character:
		$AudioStreamPlayer2D.play()
		body.queue_animations(success_dialogue)
		body.queue_animations([[null, funcref(self, "delete_sprite")]])
		yield(get_tree().create_timer(8), "timeout")
		$AudioStreamPlayer2D.stop()
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

func _on_body_exited(body):
	if body.name == "PlayerCharacter":
		in_body = false
