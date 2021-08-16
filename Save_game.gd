extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


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
var velocity = Vector2()
var direction = 'up'

# Ring buffer of steps*4 previous positions and directions
# Used to anumate followers along path

var cutscene = false
var positions = []
var directions = []

func _on_pressed():
	var main = get_node("../../../../../")
	var player = main.get_node("YSort/PlayerCharacter")
	var state = {
		"x": player.position.x,
		"y": player.position.y,
		"people_qty": player.people_qty,
		"positions": player.positions,
		"directions": player.directions,
		"peep_offset": player.peep_offset,
		"direction": player.direction
	}
	var scroll_paths = ["YSort/Map/Hub/Scroll",
						"YSort/Map/Ruin/Scroll/Node2D",
						"YSort/Map/Swamp/Scrolls/Node2D",
						"YSort/Map/Meadow/Scroll"]
	for node in scroll_paths:
		state[node] = main.get_node(node) != null
	
	var selective_delete_paths = ["YSort/Fog",
								  "YSort/MeadowDoor",
								  "YSort/Bridge"]
	for node in selective_delete_paths:
		state[node] = main.get_node(node) != null
	
	var saveable_sprites = ["YSort/BridgeSprite",
							"YSort/Door"]
	
	for sprite in saveable_sprites:
		state[sprite] = {
			"animation": main.get_node(sprite).animation,
			"frame": main.get_node(sprite).frame
		}
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(state))
	save_game.close()
