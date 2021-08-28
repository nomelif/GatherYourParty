extends Camera2D


var places = {"Hub": [-400, -200, 4000, 3800],
			  "Ruins": [3800, -200, 7200, 2290],
			  "Swamp": [3600, 2300, 7200, 4800],
			  "Meadow": [-394.311, 3403.773, 3983.097, 6183.847]}

func move_to(place):
	self.limit_left = places[place][0]
	self.limit_top = places[place][1]
	self.limit_right = places[place][2]
	self.limit_bottom = places[place][3]
