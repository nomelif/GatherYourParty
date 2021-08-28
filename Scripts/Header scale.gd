extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# 740 * 2 ^ x = get_viewport.size.x
	# x = floor(log_2(get_viewport.size.x / 740))
	var scale_mul =  0.5 * pow(2, floor(log((get_viewport().size.x - position.x) / 740) / log(2)))
	scale = Vector2(scale_mul, scale_mul)
