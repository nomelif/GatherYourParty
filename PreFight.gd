extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer = Timer.new()
var main_scene = load("res://Boss.tscn")
var done = false

# Called when the node enters the scene tree for the first time.
func _ready():
	rect_size.x = get_viewport().size.x;
	rect_size.y = get_viewport().size.y;
	$View.position.x = get_viewport().size.x / 2 - 512;
	$View.position.y = get_viewport().size.y / 2 - 300;
	yield(get_tree().create_timer(1), "timeout")
	for x in range(1, 5):
		get_node("View/Head" + str(x)).play()
		yield(get_node("View/Head" + str(x)), "animation_finished")
	$AudioStreamPlayer.play()
	for x in range(1, 5):
		get_node("View/Head" + str(x)).play("Yell")
	yield(get_node("View/Head4"), "animation_finished")
	yield(get_tree().create_timer(1), "timeout")
	done = true
	var boss = main_scene.instance()
	remove_child($View)
	add_child(boss)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if done:
		return
	rect_size.x = get_viewport().size.x;
	rect_size.y = get_viewport().size.y;
	$View.position.x = get_viewport().size.x / 2 - 512;
	$View.position.y = get_viewport().size.y / 2 - 300;
