extends Node

@onready var playerRef : Gambler = $"../Player/Gambler"
var dealer : Gambler = Gambler.new()

func startRound():
	#Make sure no other cards are in their hands, for whatever reason.
	dealer.clearHand()
	playerRef.clearHand()
	
	#Start with 1 card, face up.
	dealer.getCard()
	playerRef.getCard()
	
	var dealerHand = dealer.getHand()
	var dealerPos = 0
	for card in dealerHand:
		card.position = Vector2((1150/2) + dealerPos, 100)
		dealerPos += 50
	pass
	print("started round")
	
func _on_start_button_pressed() -> void:
	startRound()
