extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var children = get_children()
	for i in len(children):
		var sprite = children[len(children)-i-1].get_child(0)
		sprite.frame = i % 3
		sprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
