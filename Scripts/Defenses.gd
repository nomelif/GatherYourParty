extends Node2D

var current_visible = null
var animation_running = false

func _process(delta):

	# Pick only one press

	var current_press = null
	if Input.is_action_just_pressed("left"):
		current_press = "fighter"
	if Input.is_action_just_pressed("up"):
		current_press = "healer"
	if Input.is_action_just_pressed("down"):
		current_press = "protector"
	if Input.is_action_just_pressed("right"):
		current_press = "sorceress"

	# Only switch shields when
	# - something is pressed
	# - the selection is not the currently active shield
	# - not already in transition

	if current_press != null && current_press != current_visible && not animation_running:
		animation_running = true

		# Play disappearing animation for outgoing sheild

		if current_visible != null:
			get_node("Protect_" + current_visible).play("Deactivate")
			yield(get_node("Protect_" + current_visible), "animation_finished")

		# Get current shield up

		get_node("Protect_" + current_press).play("Activate")
		yield(get_node("Protect_" + current_press), "animation_finished")
		current_visible = current_press
		animation_running = false
