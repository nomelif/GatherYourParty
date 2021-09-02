extends Area2D

var listening = true

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
			play_demon_growl()
			yield(get_tree().create_timer(0.5), "timeout")
			play_beast_growl_1()
			yield(get_tree().create_timer(2.5), "timeout")
			play_stab()
			yield(get_tree().create_timer(0.2), "timeout")
			play_dieing_beast()
			yield(get_tree().create_timer(3), "timeout")
			get_tree().change_scene("res://Scenes/Credit Scene/Credits.tscn");
		else:
			health.margin_right -= 20

func play_stab():
	get_node("/root/Node2D/Node2D2/Post boss sounds/stab").play()
	yield(get_tree().create_timer(0.7), "timeout")
	get_node("/root/Node2D/Node2D2/Post boss sounds/stab").stop()

func play_dieing_beast():
	get_node("/root/Node2D/Node2D2/Post boss sounds/dieing beast").play()
	yield(get_tree().create_timer(1.41), "timeout")
	get_node("/root/Node2D/Node2D2/Post boss sounds/dieing beast").stop()

func play_demon_growl():
	get_node("/root/Node2D/Node2D2/Post boss sounds/demon growl").play()
	yield(get_tree().create_timer(5.38), "timeout")
	get_node("/root/Node2D/Node2D2/Post boss sounds/demon growl").stop()
	
func play_beast_growl_1():
	get_node("/root/Node2D/Node2D2/Post boss sounds/beast growl 1").play()
	yield(get_tree().create_timer(1.0), "timeout")
	get_node("/root/Node2D/Node2D2/Post boss sounds/beast growl 1").stop()
