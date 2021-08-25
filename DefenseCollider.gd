extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var listening = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DefenseCollider_body_entered(body):
	if not listening:
		return
	if get_node("../../").animation_running:
		return
	if "Protect_" + str(get_node("../../").current_visible) != get_node("../").name:
		return
	if body.name == "Projectile":
		body.parent.hurt()
		body.get_parent().remove_child(body)
		var health = get_node("../../../../Healthbar base/Health")
		if health.margin_right - health.margin_left < 0:
			listening = false
			get_node("/root/Node2D/Node2D2/PlayArea/Black").visible = true
			get_node("/root/Node2D/Background music").fade = true
			yield(get_tree().create_timer(2), "timeout")
			get_node("/root/Node2D/Node2D2/Post boss sounds/sword").play()
			yield(get_tree().create_timer(3), "timeout")
			play_stab()
			yield(get_tree().create_timer(3), "timeout")
			get_tree().change_scene("res://Credits.tscn");
		else:
			health.margin_right -= 20

func play_stab():
	get_node("/root/Node2D/Node2D2/Post boss sounds/stab").play()
	yield(get_tree().create_timer(0.7), "timeout")
	get_node("/root/Node2D/Node2D2/Post boss sounds/stab").stop()
