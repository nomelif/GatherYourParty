extends KinematicBody2D

# Signal that the peep order changed

signal peeps_changed();

# Dynamics to tweak the walking and running speeds

export (int) var speed = 350
export (float) var run_multiplier = 1.5

# How many people are following at any given moment

export (int) var people_qty = 4

# Velocity and direction being faced (Velocity doesn't always determine
# direction: Velocity = 0 and direction 'down' means "idle downwards")

var velocity = Vector2()
var direction = 'up'

# Ring buffer of steps*4 previous positions and directions
# Used to animate followers along path

var cutscene = false
var steps = 20
var total_steps = steps * 4
var positions = []
var directions = []

func front_peep():
	return sprites[(peep_offset) % people_qty]

func has_peep(peep):
	return sprites.find(peep) < people_qty && peep in sprites

func _ready():
	for x in range(total_steps):
		positions.append(position)
		directions.append(direction)

# Index into ring buffer

var position_index = 0

# Order of followers, must match sprite names

var sprites = ['Fighter', 'Protector', 'Sorceress', 'Healer']
var peep_offset = 0

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
	if Input.is_action_just_pressed('switch_peeps') and not cutscene:
		peep_offset += 1
		emit_signal("peeps_changed")
		

func _physics_process(delta):
	get_input()
	if not cutscene:
		velocity = move_and_slide(velocity)
	
	# Play idle animation
	if velocity == Vector2(0, 0) or cutscene:
		for i in range(people_qty):
			get_node('../'+sprites[(i+peep_offset) % people_qty]+'Sprite').play(directions[(position_index - i*steps - 1) % total_steps] + "_idle")
	else:
		
		# Memorize position & direction
		
		positions[position_index] = position
		directions[position_index] = direction

		# Advance position index
		
		position_index += 1
		position_index %= total_steps
		
		# Play non-idle animation
		
		for i in range(people_qty):
			get_node('../'+sprites[(i+peep_offset) % people_qty]+'Sprite').play(directions[(position_index - i*steps - 1) % total_steps])
		
	# Move characters to the correct position

	for i in range(people_qty):
		get_node('../'+sprites[(i+peep_offset) % people_qty]+'Sprite').position = positions[(position_index - i*steps - 1) % total_steps]
		get_node('../../'+sprites[(i+peep_offset) % people_qty]+'Bubble').position = positions[(position_index - i*steps - 1) % total_steps]
		if i < people_qty:
			get_node('../../'+sprites[(i+peep_offset) % people_qty]+'Bubble').position += Vector2(-30, -180)
	# Make camera follow character
	get_node('../../Camera2D').position = position;	

### Animation logic

var queue = []

func queue_animations(sequence):
	for x in sequence:
		queue.append(x)
	cutscene = true
	_run_step()
	
func _run_step():
	if queue[0][0] == null:
		queue[0][1].call_func()
		_on_animation_finished()
	else:
		get_node(queue[0][0]).play(queue[0][1])

func _on_animation_finished():
	queue.pop_front()
	if len(queue) != 0:
		_run_step()
	else:
		cutscene = false
	
