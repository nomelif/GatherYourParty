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


func _on_Area2D_body_entered(body):
	if body.name == "PlayerCharacter" && visible:
		body.queue_animations([["../../"+body.front_peep()+"Bubble", "Creation"],
							   ["../../"+body.front_peep()+"Bubble", "Exclamation"],
							   ["../../"+body.front_peep()+"Bubble", "Deletion"],
							   [null, funcref(self, "post_animation")]])


func post_animation():
	$AudioStreamPlayer2D.play()
	visible = false
	yield(get_tree().create_timer(8.333), "timeout")
	self.get_parent().remove_child(self)
