class_name Betting
extends Node

var playerBet = 0
var playerAmount = 0
var chips = []

func _exit_tree() -> void:
	StaticPlayerVariables.globalPlayerMoney = playerAmount

func _ready() -> void:
	playerAmount = StaticPlayerVariables.globalPlayerMoney
	print(str(playerAmount))
	
	#while(true):
	#	await get_tree().create_timer(0.1).timeout
	#	StaticPlayerVariables.globalPlayerMoney = playerAmount

# Sorts chips to a given position.
func sortChips():
	print(str(playerBet))
	var tempBet = playerBet
	for chip in chips:
		remove_child(chip)
	chips.clear()
	
	
	while(tempBet >= 100):
		tempBet = addBet(100, tempBet)
	while(tempBet >= 50):
		tempBet = addBet(50, tempBet)
	while(tempBet >= 20):
		tempBet = addBet(20, tempBet)
	while(tempBet >= 10):
		tempBet = addBet(10, tempBet)
	while(tempBet >= 5):
		tempBet = addBet(5, tempBet)
	while(tempBet >= 1):
		tempBet = addBet(1, tempBet)
	
	var yOffset = 0
	for chip in chips:
		#chip.updateChipFace()
		chip.position = Vector2(50, 650 - yOffset)
		yOffset += 30

func loseBet():
	playerBet = 0
	sortChips()
	
	StaticPlayerVariables.globalPlayerMoney = playerAmount
	StaticPlayerVariables.playerEnergy -= 1
	print("Player energy: " + str(StaticPlayerVariables.playerEnergy))

# Guess what, you do returnMultiplyer < 1, and the eplayer loses money, rM > 1, they get money.
func winBet(returnMultipler : float):
	playerAmount += playerBet * returnMultipler
	playerBet = 0
	sortChips()
	
	StaticPlayerVariables.globalPlayerMoney = playerAmount
	StaticPlayerVariables.playerEnergy -= 1

func getPlayerAmount():
	return playerAmount

func getPlayerBet():
	return playerBet

func addBet(value, tBet):
	chips.push_back(makeChip(value))
	return tBet - value

func makeChip(value):
	var chip = Chip.new()
	chip.setValue(value)
	add_child(chip)
	chip.updateChipFace()
	return chip

func add(value):
	#var tempChip = Chip.new()
	#tempChip.setValue(value)
	#typeof(tempChip.getValue()) != TYPE_STRING &&
	if(playerAmount >= value):
		print("Bet +" + str(value))
		playerBet += value
		playerAmount -= value
	else:
		print("Player cannot afford $" + str(value))
	#tempChip.free()
	sortChips()

func remove(value):
	#var tempChip = Chip.new()
	#tempChip.setValue(value)
	#typeof(tempChip.getValue()) != TYPE_STRING &&
	if( playerBet >= value):
		print("Bet -" + str(value))
		playerAmount += value
		playerBet -= value
	else:
		print("Player has not bet enough to take out " + str(value))
	#tempChip.free()
	sortChips()
