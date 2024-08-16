extends Node

var hitPossible = true
var handScore = 0;
var hand = []

func updateLabel() -> Array:
	var scoreString = ""
	var handString = ""
	# Update Score Label ---------------------
	if(handScore > 21):
		scoreString = "Current score: " + str(handScore) + "\nYou're bust"
		hitPossible = false
	elif(handScore == 21):
		scoreString = "Current score: " + str(handScore) + "\non the numbers."
	else:
		scoreString = "Current score: " + str(handScore)
	
	# Update hand label ---------------------
	handString = "Your hand contains: "
	for card in hand:
		handString += "\n" + str(card)
	
	return [scoreString, handString]

func getScore() -> int:
	return handScore

func addScore(num):
	handScore += num

func hit():
	if(hitPossible):
		#Make a number, 1 to 14, inclusive. 1 to 10 is normal, 11 to 13 is face, 14 is ace.
		var cardScore = randi_range(1,14)
		#Add to handScore. -------------------
		if(cardScore == 14): #Ace, add 11
			addScore(11)
			hand.push_back("ace")
		elif (cardScore > 10): #Face, add 10
			addScore(10)
			hand.push_back("face")
		else: #Normal Card, add its score.
			addScore(cardScore)
			hand.push_back("number: " + str(cardScore))
	updateLabel()
	
func stand(): #When stand, check this handScore vs the dealer's handScore.
	handScore = 0
	hand = []
	hitPossible = true
	updateLabel()
