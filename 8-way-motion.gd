extends KinematicBody2D

export (int) var speed = 350

var velocity = Vector2()
var direction = 'down'
var positions = []
var directions = []
var position_index = 0

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		direction = 'right'
		velocity.x += 1
	if Input.is_action_pressed('left'):
		direction = 'left'
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		direction = 'down'
		velocity.y += 1
	if Input.is_action_pressed('up'):
		direction = 'up'
		velocity.y -= 1
	if velocity != Vector2(0, 0):
		$FighterSprite.play(direction)
	else:
		$FighterSprite.play(direction + "_idle")
	# get_node('../SorceressSprite').play(animation_choice)
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	if len(positions) == 20:
		if velocity == Vector2(0, 0):
			get_node('../SorceressSprite').play(directions[(position_index + 1) % 20] + "_idle")
		else:
			get_node('../SorceressSprite').play(directions[(position_index + 1) % 20])
	
	if not velocity == Vector2(0, 0):
		if len(positions) < 20:
			positions.append(position)
			directions.append(direction)
			position_index += 1
			position_index %= 20
		else:
			positions[position_index] = position
			directions[position_index] = direction
			position_index += 1
			position_index %= 20
			if len(positions) == 20:
				get_node('../SorceressSprite').position = positions[(position_index + 1) % 20]
				if get_node('../SorceressSprite').position.y > position.y:
					get_node('../SorceressSprite').z_index = z_index + 1
				else:
					get_node('../SorceressSprite').z_index = z_index - 1
	
