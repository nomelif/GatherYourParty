extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var gem_qty = 1;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func increment_door():
	get_node("Door " + str(gem_qty) + " gem").visible = false;
	gem_qty += 1;
	get_node("Door " + str(gem_qty) + " gem").visible = true;
