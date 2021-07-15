extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = get_viewport().size.x / 2 - $Background.rect_size.x / 2;
	position.y = get_viewport().size.y / 2 - $Background.rect_size.y / 2;
	get_node("../Black").rect_size.x = get_viewport().size.x;
	get_node("../Black").rect_size.y = get_viewport().size.y;
	#$ColorRect.rect_size.x = get_viewport().size.x;
	#$ColorRect.rect_size.y = get_viewport().size.y;
