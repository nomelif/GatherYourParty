extends KinematicBody2D

export (int) var speed = 350

var velocity = Vector2()
var direction = 'down'
var positions = []
var directions = []
var position_index = 0
var sprites = ['Sorceress', 'Protector', 'Healer']
var y_order = []

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
	
	if len(positions) == 60:
		if velocity == Vector2(0, 0):
			for i in range(3):
				get_node('../'+sprites[i]+'Sprite').play(directions[(position_index + 1 + i*20) % 60] + "_idle")
		else:
			for i in range(3):
				get_node('../'+sprites[i]+'Sprite').play(directions[(position_index + 1 + i*20) % 60])
	
	if not velocity == Vector2(0, 0):
		if len(positions) < 60:
			positions.append(position)
			directions.append(direction)
			position_index += 1
			position_index %= 20
		else:
			positions[position_index] = position
			directions[position_index] = direction
			position_index += 1
			position_index %= 60
			if len(positions) == 60:
				for i in range(3):
					get_node('../'+sprites[i]+'Sprite').position = positions[(position_index + 1 + i*20) % 60]
				y_order = [['FighterSprite', position.y]]
				for i in range(3):
					y_order.append(['../'+sprites[i]+'Sprite', get_node('../'+sprites[i]+'Sprite').position.y])
				y_order.sort()
				for i in range(4):
					get_node(y_order[i][0]).z_index = 10 - i
	get_node('../Camera2D').position = position;	
