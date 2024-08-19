class_name Gambler extends Node

var hand = []
var isPlayer = false

	#Adds a random card to hand using the randCard() func from the Card Class.
func getCard():
	var newCard = Card.new()
	newCard.randCard()
	hand.push_front(newCard)
	
func clearHand():
	hand.clear()
	
	#Debug Stuff
func readHand():
	for i in range(len(hand)):
		print("Card: " + str(i+1))
		print(hand[i].getSuit())
		print(hand[i].getValue())
	
func _on_hit_button_pressed() -> void:
	getCard()
	readHand()
