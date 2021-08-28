extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass



func _on_Hub_to_Ruins_Collider_body_exited(body):
	if body.name == "PlayerCharacter":
		if body.position.x > self.position.x:
			get_node("../Camera2D").move_to("Swamp")
		else:
			get_node("../Camera2D").move_to("Hub")
