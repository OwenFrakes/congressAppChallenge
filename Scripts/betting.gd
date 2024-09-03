extends Node

var playerBet = 0
var playerAmount = 0
var chips = []

func _ready() -> void:
	playerAmount = StaticPlayerVariables.globalPlayerMoney
	print(str(playerAmount))

func addChipToArray(chip):
	playerBet += chip.getValue()

# Sorts chips to a given position.
func sortChips():
	var tempBet = playerBet
	chips.clear()
	
	if(tempBet >= 100):
		tempBet -= 100
		chips.push_back(makeChip(100))
	elif(tempBet >= 50):
		tempBet -= 50
		chips.push_back(makeChip(50))

func makeChip(value):
	var chip = Chip.new()
	chip.setValue(value)
	return chip

#Connected to a button, on press, it will add $1 to the player bet.
func add1():
	if(playerAmount >= 1):
		playerBet += 1
		playerAmount -= 1

func remove1():
	if(playerBet >= 1):
		playerAmount += 1
		playerBet -= 1
