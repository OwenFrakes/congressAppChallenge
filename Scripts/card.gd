class_name Card extends AnimatedSprite2D

var suit = ""
var value = 0
var faceUp = false

func _ready():
	sprite_frames = load("res://Resources/ClubsSpriteSheet.tres")
	set_texture_filter(1)
	#set_scale(Vector2(0.75, 0.75))

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
		pause()
		set_frame_and_progress(getValue() - 1, frame_progress) 
	else :
		frame = 13
	
func getValue():
	return value
	
func getSuit():
	return suit
	
