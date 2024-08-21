class_name Gambler extends Node

var hand = []
var isPlayer = false #Denotes that this gambler is being controlled by the player. Or the opposite.

	#Adds a random card to hand using the randCard() func from the Card Class.
func getCard(faceUp: bool = false):
	var newCard = Card.new()
	newCard.randCard(faceUp)
	add_child(newCard)
	hand.push_front(newCard)
	
	#Remove all cards from gambler's hand.
func clearHand():
	hand.clear()
	
	#Return an array of cards. The gambler's hand.
func getHand():
	return hand
	
	#Debug Stuff
func readHand():
	for i in range(len(hand)):
		print("Card: " + str(i+1))
		print(hand[i].getSuit())
		print(hand[i].getValue())
	
func _on_hit_button_pressed() -> void:
	getCard()
	readHand()
