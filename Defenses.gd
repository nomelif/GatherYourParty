extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_visible = null
var animation_running = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current_press = null
	if Input.is_action_just_pressed("left"):
		current_press = "fighter"
	if Input.is_action_just_pressed("up"):
		current_press = "healer"
	if Input.is_action_just_pressed("right"):
		current_press = "protector"
	if Input.is_action_just_pressed("down"):
		current_press = "sorceress"
	if current_press != null && current_press != current_visible && not animation_running:
		animation_running = true
		if current_visible != null:
			get_node("Protect_" + current_visible).play("Deactivate")
			yield(get_node("Protect_" + current_visible), "animation_finished")
		get_node("Protect_" + current_press).play("Activate")
		yield(get_node("Protect_" + current_press), "animation_finished")
		current_visible = current_press
		animation_running = false
