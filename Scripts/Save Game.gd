extends Button

func _on_button_up():
	$Pressed.visible = false
	$Shadow.visible = true

func _on_button_down():
	$Pressed.visible = true
	$Shadow.visible = false

func _on_pressed():

	# Get relevant nodes

	var main = get_node("../../../../../")
	var player = main.get_node("YSort/PlayerCharacter")
	var camera = main.get_node("Camera2D")

	# Easily readable state from main nodes

	var state = {
		"x": player.position.x,
		"y": player.position.y,
		"people_qty": player.people_qty,
		"positions": [],
		"directions": player.directions,
		"peep_offset": player.peep_offset,
		"direction": player.direction,
		"position_index": player.position_index,
		"limit_left": camera.limit_left,
		"limit_top": camera.limit_top,
		"limit_right": camera.limit_right,
		"limit_bottom": camera.limit_bottom
	}

	# Transform positions from vectors to arrays
	
	var positions = []
	
	for position in player.positions:
		positions.append([position.x, position.y])
	state["positions"] = positions

	# Check whether scrolls & other deletables still exist

	var delete_paths = ["YSort/Map/Hub/Scroll",
						"YSort/Map/Ruin/Scroll/Node2D",
						"YSort/Map/Swamp/Scrolls/Node2D",
						"YSort/Map/Meadow/Scroll",
						"YSort/Fog",
						"YSort/MeadowDoor",
						"YSort/Bridge"]
	for node in delete_paths:

		# Get causes an error, it's safe to ignore

		state[node] = main.get_node(node) != null
		
		# A scroll hides before deleting
		
		if state[node] and not main.get_node(node).visible:
			state[node] = false
			

	# Sprites to save the state of
	
	var saveable_sprites = ["YSort/BridgeSprite",
							"YSort/Door"]
	
	for sprite in saveable_sprites:
		state[sprite] = {
			"animation": main.get_node(sprite).animation,
			"frame": main.get_node(sprite).frame
		}

	# Write out actual save file

	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(state))
	save_game.close()
