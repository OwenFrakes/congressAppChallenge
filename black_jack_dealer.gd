extends Node

@onready var playerRef : Gambler = $"../Player/Gambler"
var dealer : Gambler

func _ready():
	dealer = Gambler.new()
	add_child(dealer)

func startRound():
	#Make sure no other cards are in their hands, for whatever reason.
	dealer.clearHand()
	playerRef.clearHand()
	
	#Start with 1 card, face up.
	dealer.getCard(true)
	playerRef.getCard(true)
	
	#Arrange the hands.
	arrangeDealerHand()
	arrangePlayerHand()
	
	print("started round")
	
	#Disable the start round button, and wait 2 seconds before continuing.
	toggleStartBtn(false)
	await get_tree().create_timer(1).timeout # This is basically a sleep() method.
	
	#Next step to play blackjack.
	dealer.getCard(false)
	playerRef.getCard(true)
	arrangeDealerHand()
	arrangePlayerHand()
	
	#After last step, check if player or house has blackjack, otherwise continue.
	checkHand()
	
	#Turn on the hit / stay buttons, after .5 second timeout/sleep.
	await get_tree().create_timer(.5).timeout
	#From here player chooses to hit or stay.
	toggleHitStay(true)

#The screen is 1152 pixels wide. And 648 Tall.
#Arranges the dealer's hand.
func arrangeDealerHand():
	var dealerHand = dealer.getHand()
	var dealerPos = 0
	for card in dealerHand:
		card.position = Vector2((1152/2 + dealerPos), 100)
		dealerPos += 50

#Arranges the player's hand.
func arrangePlayerHand():
	var playerHand = playerRef.getHand()
	var playerPos = 0
	for card in playerHand:
		card.position = Vector2((1152/2 + playerPos), 550)
		playerPos += 50

# Gets the total of a given hand, needs a hand as a parameter.
func handTotal(hand):
	var handTotal = 0
	for card in hand:
		handTotal += card.getValue()
	return handTotal

#Automatically checks the players hand. And only the players hand.
#"ends" the round by turning the buttons on/off, otherwise contiunes.
func checkHand():
	var handTotal = handTotal(playerRef.getHand())
	
	if(handTotal == 21):
		print("Blackjack")
		toggleHitStay(false)
		toggleStartBtn(true)
	elif(handTotal > 21):
		print("Player Bust: " + str(handTotal))
		toggleHitStay(false)
		toggleStartBtn(true)
	else:
		print("Player under: " + str(handTotal))

#If boolean is true, it enables the start button, false disables it.
func toggleStartBtn(boolean):
	if(boolean):
		$"../StartButton".disabled = false
	else:
		$"../StartButton".disabled = true

#If boolean is true, it enables the buttons, and false disables them.
func toggleHitStay(boolean):
	if(boolean):
		$"../HitButton".disabled = false
		$"../StayButton".disabled = false
	else:
		$"../HitButton".disabled = true
		$"../StayButton".disabled = true

# Add a card to the players hand, arrange, then check for blackjack or bust.
func playerHit():
	playerRef.getCard(true)
	arrangePlayerHand()
	checkHand()

# Progress to final stage of blackjack.
func playerStay():
	
	#Reveals dealer's face down card.
	toggleHitStay(false)
	for card in dealer.getHand():
		card.faceUp = true
		card.updateCardFace
	arrangeDealerHand()
	
	#If dealer's hand total is 16 or lower, get another card.
	#Else, check for bust, then check against player's hand total.
	

#Signals from buttons.
func _on_start_button_pressed() -> void:
	startRound()

func _on_hit_button_pressed() -> void:
	playerHit()

func _on_stay_button_pressed() -> void:
	playerStay()
