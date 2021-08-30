extends Node2D

func _process(delta):
	# 740 * 2 ^ x = get_viewport.size.x
	# x = floor(log_2(get_viewport.size.x / 740))
	var scale_mul =  0.5 * pow(2, floor(log((get_viewport().size.x - position.x) / 740) / log(2)))
	scale = Vector2(scale_mul, scale_mul)
