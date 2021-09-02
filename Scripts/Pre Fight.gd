extends ColorRect

var timer = Timer.new()
var main_scene = load("res://Scenes/Areas/Boss.tscn")
var done = false # Whether the cutscene is done

func _ready():
	rect_size.x = get_viewport().size.x;
	rect_size.y = get_viewport().size.y;
	$View.position.x = get_viewport().size.x / 2 - 512;
	$View.position.y = get_viewport().size.y / 2 - 300;
	yield(get_tree().create_timer(1), "timeout")
	$Growl.play()
	for x in range(1, 5):
		get_node("View/Head" + str(x)).play()
		yield(get_node("View/Head" + str(x)), "animation_finished")
	$"Background music".play()
	$Roar.play()
	$Roar.pitch_scale = 0.7
	for x in range(1, 5):
		get_node("View/Head" + str(x)).play("Yell")
	yield(get_node("View/Head4"), "animation_finished")
	yield(get_tree().create_timer(1), "timeout")
	done = true
	var boss = main_scene.instance()
	remove_child($View)
	$Growl.stop()
	remove_child($Growl)
	add_child(boss)


# Resize content to match viewport

func _process(delta):
	if done: # Don't try to resize after cutscene is done
		return
	rect_size.x = get_viewport().size.x;
	rect_size.y = get_viewport().size.y;
	$View.position.x = get_viewport().size.x / 2 - 512;
	$View.position.y = get_viewport().size.y / 2 - 300;
