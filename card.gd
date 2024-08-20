class_name Card extends Node2D

var suit = ""
var value = 0
var cardImage = Sprite2D.new()

func setCard(newSuit, newValue):
	suit = newSuit
	value = newValue
	
func randCard():
	var suitNum = randi_range(1,4)
	match(suitNum):
		1:
			suit = "Clubs"
		2:
			suit = "Diamonds"
		3:
			suit = "Spades"
		4:
			suit = "Hearts"
			
	var cardType = randi_range(1,13)
	
	if(cardType > 10):
		value = 10
	else:
		value = cardType
	add_child(cardImage)
	updateCardFace()
	
func updateCardFace():
	cardImage.texture = load("res://icon.svg")
	
func getValue():
	return value
	
func getSuit():
	return suit
	
