extends KinematicBody2D

export (int) var speed = 350

var velocity = Vector2()
var idle_animation = 'default'
var positions = []
var position_index = 0

func get_input():
	velocity = Vector2()
	var animation_choice = idle_animation
	if Input.is_action_pressed('right'):
		animation_choice = 'right'
		velocity.x += 1
	if Input.is_action_pressed('left'):
		animation_choice = 'left'
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		animation_choice = 'down'
		velocity.y += 1
	if Input.is_action_pressed('up'):
		animation_choice = 'up'
		velocity.y -= 1
	
	if "idle" in animation_choice:
		idle_animation = animation_choice
	else:
		idle_animation = animation_choice + "_idle"
	
	$FighterSprite.play(animation_choice)
	get_node('../SorceressSprite').play(animation_choice)
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	if not velocity == Vector2(0, 0):
		if len(positions) < 20:
			positions.append(position)
			position_index += 1
			position_index %= 20
		else:
			positions[position_index] = position
			position_index += 1
			position_index %= 20
			if len(positions) == 20:
				get_node('../SorceressSprite').position = positions[(position_index + 1) % 20]
				if get_node('../SorceressSprite').position.y > position.y:
					get_node('../SorceressSprite').z_index = z_index + 1
				else:
					get_node('../SorceressSprite').z_index = z_index - 1
	
