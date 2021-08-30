extends Node2D

func _ready():
	position.x = get_viewport().size.x / 2 - $Background.rect_size.x / 2;
	position.y = get_viewport().size.y / 2 - $Background.rect_size.y / 2;
	get_node("../Black").rect_size.x = get_viewport().size.x;
	get_node("../Black").rect_size.y = get_viewport().size.y;

func _process(delta):
	position.x = get_viewport().size.x / 2 - $Background.rect_size.x / 2;
	position.y = get_viewport().size.y / 2 - $Background.rect_size.y / 2;
	get_node("../Black").rect_size.x = get_viewport().size.x;
	get_node("../Black").rect_size.y = get_viewport().size.y;
