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

func _on_Protector_pickup_body_entered(body):
	if body.name == "PlayerCharacter":
		body.people_qty = 2
		get_parent().remove_child(self)
