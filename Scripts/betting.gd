class_name Betting
extends Node

var playerBet = 0
var playerAmount = 0
var chips = []

func _ready() -> void:
	playerAmount = StaticPlayerVariables.globalPlayerMoney
	print(str(playerAmount))

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
		chip.position = Vector2(30, 700 - yOffset)
		yOffset += 10

func addBet(value, tBet):
	chips.push_back(makeChip(value))
	return tBet - value

func makeChip(value):
	var chip = Chip.new()
	chip.setValue(value)
	add_child(chip)
	chip.updateChipFace()
	return chip

func add1():
	if(playerAmount >= 1):
		print("Bet +1")
		playerBet += 1
		playerAmount -= 1
	else:
		print("Player cannot afford $1")
	sortChips()

func remove1():
	if(playerBet >= 1):
		playerAmount += 1
		playerBet -= 1
	else:
		print("Player has not bet enough to take out 1")
	sortChips()
