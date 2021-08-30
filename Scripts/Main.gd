extends Node2D

func _ready():

	# Try to load savefile

	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # No savefile
	
	# Read contents of savefile
	
	save_game.open("user://savegame.save", File.READ)
	var state = parse_json(save_game.get_line())
	save_game.close()
	
	# Restore player state
	
	$YSort/PlayerCharacter.position.x = state["x"]
	$YSort/PlayerCharacter.position.y = state["y"]
	$YSort/PlayerCharacter.people_qty = int(state["people_qty"])
	var positions = []
	for position in state["positions"]:
		positions.append(Vector2(position[0], position[1]))
	$YSort/PlayerCharacter.positions = positions
	$YSort/PlayerCharacter.position_index = int(state["position_index"])
	$YSort/PlayerCharacter.directions = state["directions"]
	$YSort/PlayerCharacter.peep_offset = int(state["peep_offset"])
	$YSort/PlayerCharacter.direction = state["direction"]
	
	# Show peeps that are following you
	
	for i in range(0, state["people_qty"]):
		get_node("YSort/" + ["Fighter", "Protector", "Sorceress", "Healer"][i] + "Sprite").visible = true
	
	
	# Delete peep pickups that have been deleted
	
	for i in range(0, state["people_qty"]-1):
		var pickup = get_node("YSort/" + ["Protector", "Sorceress", "Healer"][i] + "_pickup")
		pickup.get_parent().remove_child(pickup)
	
	# Load camera state
	
	$Camera2D.limit_left = state["limit_left"]
	$Camera2D.limit_top = state["limit_top"]
	$Camera2D.limit_right = state["limit_right"]
	$Camera2D.limit_bottom = state["limit_bottom"]
	
	# Delete scrolls that are no longer around
	
	var scroll_paths = ["YSort/Map/Hub/Scroll",
						"YSort/Map/Ruin/Scroll/Node2D",
						"YSort/Map/Swamp/Scrolls/Node2D",
						"YSort/Map/Meadow/Scroll"]
	
	for scroll in scroll_paths:
		if not state[scroll]:
			var node = get_node(scroll)
			node.get_parent().remove_child(node)
	
	# Selective delete
	
	var selective_delete_paths = ["YSort/Fog",
								  "YSort/MeadowDoor",
								  "YSort/Bridge"]
	
	for item in selective_delete_paths:
		if not state[item]:
			var node = get_node(item)
			node.get_parent().remove_child(node)
	
	# Set saveable sprites
	
	var saveable_sprites = ["YSort/BridgeSprite",
							"YSort/Door"]
	
	for sprite in saveable_sprites:
		var node = get_node(sprite)
		node.animation = state[sprite]["animation"]
		node.frame = int(state[sprite]["frame"])
