extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(String) var character;
export(Array) var dialogue = [];
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

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
