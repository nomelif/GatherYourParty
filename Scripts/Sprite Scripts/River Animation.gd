extends Node2D

func _ready():
	var children = get_children()
	for i in len(children):
		var sprite = children[len(children)-i-1].get_child(0)
		sprite.frame = i % 3
		sprite.play()
