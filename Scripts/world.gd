extends Node


var world = [[0,0,0,0,0],
			 [0,0,1,0,0],
			 [0,0,0,0,0],
			 [0,0,0,0,0],
			 [0,0,0,0,0]]
var playerX = 2
var playerY = 2
var playerFacing = "NORTH"

func move():
	match(playerFacing):
		"NORTH":
			if(playerY != 0):
				playerY -= 1
		"SOUTH":
			if(playerY != 4):
				playerY += 1
		"WEST":
			if(playerX != 0):
				playerX -= 1
		"EAST":
			if(playerX != 4):
				playerX += 1



##Old code, keeping it around just in case.
##func _ready():
##	for y in range(5):
##		world.append([])
##		for x in range(5):
##			world[y].append(0)
##	for row in world:
##		print(row)
