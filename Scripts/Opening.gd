extends Node2D

var main_scene = load("res://Scenes/Main.tscn")
var done = false

func _ready():
	$"Animation sprite".play()
	$AudioStreamPlayer.play()

func _process(delta):
	if done:
		return
	$"Animation sprite".position.x = get_viewport().size.x / 2;
	$"Animation sprite".position.y = get_viewport().size.y / 2;
	$ColorRect.rect_size.x = get_viewport().size.x;
	$ColorRect.rect_size.y = get_viewport().size.y;


func _on_Animation_sprite_animation_finished():
	done = true
	var main = main_scene.instance()
	remove_child($"Animation sprite")
	remove_child($ColorRect)

	# Embed main such that music can play over the load boundary

	add_child(main)
