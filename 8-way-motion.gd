extends KinematicBody2D

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
# Used to anumate followers along path

var steps = 20
var total_steps = steps * 4
var positions = []
var directions = []

func front_peep():
	return sprites[(peep_offset) % people_qty]

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
	if Input.is_action_just_pressed('switch_peeps'):
		peep_offset += 1
		

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	# Play idle animation
	if velocity == Vector2(0, 0):
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
	
	# Make camera follow character
	
	get_node('/root/Main/Camera2D').position = position;	
