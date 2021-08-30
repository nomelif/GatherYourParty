extends Node2D

func _ready():
	position.x = get_viewport().size.x - 172 - 20;
	position.y = get_viewport().size.y - 400;

func _process(delta):
	position.x = get_viewport().size.x - 172 - 20;
	position.y = get_viewport().size.y - 400;
