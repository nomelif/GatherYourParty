extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(String) var character;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_body_entered(body):
	if body.name == "PlayerCharacter":
		body.people_qty += 1
		get_node('../'+character+'Sprite').visible = true
		get_parent().remove_child(self)
