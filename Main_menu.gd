extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = get_viewport().size.x / 2 - 172 / 2;
	position.y = get_viewport().size.y / 2 - 300;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = get_viewport().size.x / 2 - 172 / 2;
	position.y = get_viewport().size.y / 2 - 200;
