class_name Card extends Sprite2D

var suit = ""
var value = 0
var faceUp = false

func setCard(newSuit, newValue):
	suit = newSuit
	value = newValue
	
func randCard(newFaceUp: bool = false):
	if(newFaceUp):
		faceUp = true
	else:
		faceUp = false
	
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
	updateCardFace()
	
func updateCardFace():
	if(faceUp):
		texture = load("res://TestSpadeAce.png")
	else :
		texture = load("res://TestSpadeBack.png")
	
func getValue():
	return value
	
func getSuit():
	return suit
	
