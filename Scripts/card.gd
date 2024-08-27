class_name Card extends AnimatedSprite2D

var suit = ""
var value = 0
var cardType = 0
var faceUp = false

func _ready():
	set_texture_filter(1)

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
	
	#Generatre a type and value, type can be numbers or face. And value is value, face 10, numbers = number.
	cardType = randi_range(1,13)
	
	if(cardType > 10):
		value = 10
	else:
		value = cardType
	updateCardFace()
	
func updateCardFace():
	match(getSuit()):
			"Spades":
				sprite_frames = load("res://Resources/SpriteSheets/SpadesSpriteSheet.tres")
			"Clubs":
				sprite_frames = load("res://Resources/SpriteSheets/ClubsSpriteSheet.tres")
			"Hearts":
				sprite_frames = load("res://Resources/SpriteSheets/HeartsSpriteSheet.tres")
			"Diamonds":
				sprite_frames = load("res://Resources/SpriteSheets/DiamondsSpriteSheet.tres")
	if(faceUp):
		pause()
		set_frame_and_progress(getCardType() - 1, frame_progress) 
	else :
		frame = 13
	
func getCardType():
	return cardType

func getValue():
	return value

func getSuit():
	return suit
