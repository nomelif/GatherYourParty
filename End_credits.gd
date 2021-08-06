extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var tween = Tween.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	tween.interpolate_property(get_node("View/Scrollable"),
		"position", Vector2(0, 3000), Vector2(0, 0), 30,
		Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property(get_node("ColorRect"),
		"color", Color.black, Color(0, 0, 0.1), 10,
		Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property(get_node("View/Stars"),
		"modulate", Color.white, Color(1, 1, 1, 0), 25,
		Tween.TRANS_LINEAR, Tween.EASE_OUT)
	add_child(tween)
	tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	$View.position.x = get_viewport().size.x / 2 - 512;
	$View.position.y = get_viewport().size.y / 2 - 300;
	$ColorRect.rect_size.x = get_viewport().size.x;
	$ColorRect.rect_size.y = get_viewport().size.y;
