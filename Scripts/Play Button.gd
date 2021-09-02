extends Button

export var preserve_save = false

func _on_button_up():
	$Pressed.visible = false
	$Shadow.visible = true


func _on_button_down():
	$Pressed.visible = true
	$Shadow.visible = false


func _on_pressed():
	if not preserve_save:
		Directory.new().remove("user://savegame.save")
	var save_game = File.new()
	if save_game.file_exists("user://savegame.save"):
		get_tree().change_scene("res://Scenes/Main.tscn")
	else:
		get_tree().change_scene("res://Scenes/Opening.tscn");
