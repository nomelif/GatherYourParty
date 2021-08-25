extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed_factor = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SpeechBubble_frame_changed():
	if frame == 1:
		get_node("Sounds/"+self.animation).pitch_scale = speed_factor
		get_node("Sounds/"+self.animation).play()
