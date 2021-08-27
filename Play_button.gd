extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var preserve_save = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

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
		get_tree().change_scene("res://Main.tscn")
	else:
		get_tree().change_scene("res://Opening.tscn");
