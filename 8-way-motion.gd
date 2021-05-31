extends KinematicBody2D

export (int) var speed = 350
export (float) var run_multiplier = 1.5
export (int) var people_qty = 4

var velocity = Vector2()
var direction = 'down'
var positions = []
var directions = []
var position_index = 0
var sprites = ['Fighter', 'Protector', 'Sorceress', 'Healer']
var steps = 20
var total_steps = steps*people_qty

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
	var effective_speed = speed
	if Input.is_action_pressed('run'):
		effective_speed *= run_multiplier
	velocity = velocity.normalized() * effective_speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	if not velocity == Vector2(0, 0):
		if len(positions) < total_steps:
			positions.append(position)
			directions.append(direction)
		else:
			positions[position_index] = position
			directions[position_index] = direction
		position_index += 1
		position_index %= total_steps
	if len(positions) == total_steps:
		if velocity == Vector2(0, 0):
			for i in range(people_qty):
				get_node('../'+sprites[i]+'Sprite').play(directions[(position_index - i*steps - 1) % total_steps] + "_idle")
		else:
			for i in range(people_qty):
				get_node('../'+sprites[i]+'Sprite').play(directions[(position_index - i*steps - 1) % total_steps])
			if len(positions) == total_steps:
				for i in range(people_qty):
					get_node('../'+sprites[i]+'Sprite').position = positions[(position_index - i*steps - 1) % total_steps]
	get_node('/root/Main/Camera2D').position = position;	
