extends YSort


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CollisionlessFog_animation_finished():
	if $CollisionlessFog.animation == "Deletion":
		get_node("../../PlayerCharacter")._on_animation_finished()


func _on_CollisionlessFog2_animation_finished():
	if $CollisionlessFog2.animation == "Deletion":
		get_node("../../PlayerCharacter")._on_animation_finished()


func _on_CollisionlessFog3_animation_finished():
	if $CollisionlessFog3.animation == "Deletion":
		get_node("../../PlayerCharacter")._on_animation_finished()
