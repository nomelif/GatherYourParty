extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var places = {"Hub": [-400, -200, 4000, 3800],
			  "Ruins": [3800, -200, 7200, 2300],
			  "Swamp": [3600, 2300, 7200, 4800]}

func move_to(place):
	self.limit_left = places[place][0]
	self.limit_top = places[place][1]
	self.limit_right = places[place][2]
	self.limit_bottom = places[place][3]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
