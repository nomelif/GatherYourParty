extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://Credits.tscn");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rect_size.x = get_viewport().size.x;
	rect_size.y = get_viewport().size.y;
