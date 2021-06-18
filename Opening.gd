extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Animation sprite".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"Animation sprite".position.x = get_viewport().size.x / 2;
	$"Animation sprite".position.y = get_viewport().size.y / 2;
	$ColorRect.rect_size.x = get_viewport().size.x;
	$ColorRect.rect_size.y = get_viewport().size.y;


func _on_Animation_sprite_animation_finished():
	get_tree().change_scene("res://Main.tscn");
