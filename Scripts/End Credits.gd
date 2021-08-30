extends Node2D


var tween = Tween.new()

# Scroll in the credits

func _ready():
	$ColorRect.rect_size.x = get_viewport().size.x;
	$ColorRect.rect_size.y = get_viewport().size.y;
	tween.interpolate_property(get_node("View/Stars"),
		"modulate", Color(1, 1, 1, 0), Color.white, 5,
		Tween.TRANS_CUBIC, Tween.EASE_IN)
	add_child(tween)
	tween.start()
	yield(tween, "tween_all_completed")
	tween.interpolate_property(get_node("View/Scrollable"),
		"position", Vector2(0, 3000), Vector2(0, 0), 30,
		Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property(get_node("ColorRect"),
		"color", Color.black, Color(0, 0, 0.1), 10,
		Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property(get_node("View/Stars"),
		"modulate", Color.white, Color(1, 1, 1, 0), 30,
		Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()

# Re-center viewport

func _process(delta):
	$View.visible = true
	$View.position.x = get_viewport().size.x / 2 - 512;
	$View.position.y = get_viewport().size.y / 2 - 300;
	$ColorRect.rect_size.x = get_viewport().size.x;
	$ColorRect.rect_size.y = get_viewport().size.y;
