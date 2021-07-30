extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DefenseCollider_body_entered(body):
	if get_node("../../").animation_running:
		return
	if "Protect_" + str(get_node("../../").current_visible) != get_node("../").name:
		return
	if body.name == "Projectile":
		body.get_parent().remove_child(body)
		print("Projectile stopped")
