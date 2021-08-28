extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var target = self
var speed = 16000
var colors = {
	"hahmo_taka_idle_a": Color.red,
	"hahmo_taka_idle_a2": Color.seagreen,
	"hahmo_taka_idle_a3": Color.deepskyblue,
	"hahmo_taka_a_idle": Color.purple
}

var parent = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target.global_position == global_position:
		return
	move_and_slide((target.global_position - global_position).normalized() * delta * speed)

func set_target(tgt):
	self.modulate = colors[tgt.name]
	target = tgt