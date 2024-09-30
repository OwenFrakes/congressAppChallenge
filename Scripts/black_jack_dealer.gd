extends Node

var playerRef : Gambler 
var dealer : Gambler
var betMenu : BetMenu
var playerBet = 0
@onready var playerText = $"../PlayerText"
@onready var dealerText = $"../DealerText"

func _ready():
	#They may exist in script, but not the node tree, add them as children to actually use them.
	dealer = Gambler.new()
	add_child(dealer)
	playerRef = Gambler.new()
	add_child(playerRef)
	betMenu = BetMenu.new()
	add_child(betMenu)

# Stage 1, 2 cards each, dealer has 1 face down. ---------------------------------------------------------
func startRound():
	dealerText.visible = false
	playerText.visible = false
	playerBet = betMenu.getPlayerBet()
	if(typeof(playerBet) == TYPE_NIL || playerBet < 1):
		print("No bet, player can't play: " + str(playerBet))
	elif(StaticPlayerVariables.playerEnergy <= 0):
		print("Can't play, no energy.")
	else:
		betMenu.disable()
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
		await wait(1) # This is basically a sleep() method.
		
		#Next step to play blackjack.
		dealer.getCard(false)
		playerRef.getCard(true)
		arrangeDealerHand()
		arrangePlayerHand()
		
		#After last step, check if player or house has blackjack, otherwise continue.
		#Blackjack is when the gambler's first 2 cards equals 21. Blackjack only ties against blackjack, not 21.
		var playerBlackjack = false
		var dealerBlackjack = false
		if(handTotal(playerRef.getHand()) == 21):
			playerBlackjack = true
		if(handTotal(dealer.getHand()) == 21):
			dealerBlackjack = true
			
		if(playerBlackjack && dealerBlackjack):
			print("Blackjack Tie")
			#Turn dealer card up.
			dealer.getHand()[0].faceUp = true
			dealer.getHand()[0].updateCardFace()
			toggleHitStay(false)
			toggleStartBtn(true)
			betMenu.getBetNode().winBet(1)
			betMenu.enable()
		elif(playerBlackjack):
			print("Player Blackjack")
			toggleHitStay(false)
			toggleStartBtn(true)
			betMenu.getBetNode().winBet(1.5)
			betMenu.enable()
			playerText.visible = true
		elif(dealerBlackjack):
			print("Dealer Blackjack")
			#Turn dealer card up.
			dealer.getHand()[0].faceUp = true
			dealer.getHand()[0].updateCardFace()
			toggleHitStay(false)
			toggleStartBtn(true)
			betMenu.getBetNode().loseBet()
			betMenu.enable()
			dealerText.visible = true
		else:
			#Turn on the hit / stay buttons, after .5 second timeout/sleep.
			await wait(.5)
			#From here player chooses to hit or stay.
			toggleHitStay(true) # End of startRound() ------------------------------------------------------------

# Player hits, or stays.
# Add a card to the players hand, arrange, then check for blackjack or bust.
func playerHit():
	playerRef.getCard(true)
	arrangePlayerHand()
	checkHand()

# Progress to final stage of blackjack. ------------------------------------------------------------------
# The play cannot stay with bust cards. So their hand is always valid, no need to bust check the player.
func playerStay():
	
	#Reveals dealer's face down card.
	toggleHitStay(false)
	#Face down card will be the first one in the dealer's hand until further cards are added.
	dealer.getHand()[0].faceUp = true
	dealer.getHand()[0].updateCardFace()
	await wait(.5)
	
	#If dealer's hand total is 16 or lower, get another card.
	#Else, check for bust, then check against player's hand total.
	while(handTotal(dealer.getHand()) <= 16):
		dealer.getCard(true)
		arrangeDealerHand()
		await wait(.5)
	
	if(handTotal(dealer.getHand()) > 21):
		print("Dealer bust")
		printScores()
		betMenu.getBetNode().winBet(2)
		betMenu.enable()
		playerText.visible = true
	elif(handTotal(dealer.getHand()) > handTotal(playerRef.getHand())):
		print("Player Lost")
		printScores()
		betMenu.getBetNode().loseBet()
		betMenu.enable()
		dealerText.visible = true
	elif(handTotal(dealer.getHand()) == handTotal(playerRef.getHand())):
		print("tie")
		printScores()
		betMenu.getBetNode().winBet(1)
		betMenu.enable()
	else:
		print("Player Won.")
		printScores()
		betMenu.getBetNode().winBet(2)
		betMenu.enable()
		playerText.visible = true
	
	toggleStartBtn(true) # End of playerStay() ----------------------------------------------------------

# Gets the total of a given hand, needs a hand as a parameter.
func handTotal(hand):
	var total = 0
	var aces = 0
	for card in hand:
		if(card.getCardType() == 1):
			aces += 1
		else:
			total += card.getValue()
	
	while(aces > 0):
		if(total + 11 < 22):
			total += 11
		else:
			total += 1
		aces -= 1
	
	return total

#Automatically checks the players hand. And only the players hand.
#"ends" the round by turning the buttons on/off, otherwise contiunes.
func checkHand():
	var playerTotal = int(handTotal(playerRef.getHand()))
	
	if(playerTotal > 21):
		print("Player Bust: " + str(playerTotal))
		toggleHitStay(false)
		toggleStartBtn(true)
		betMenu.getBetNode().loseBet()
		betMenu.enable()
	else:
		print("Player under: " + str(playerTotal))

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

#The screen is 1280 pixels wide. And 720 tall.
#Arranges the dealer's hand.
func arrangeDealerHand():
	var dealerHand = dealer.getHand()
	var dealerPos = 0 # Shifts each of the cards over.
	var dVisLayer = 1 # Changes the order the cards are seen when overlaping.
	var dCardOffset = ((101 * (len(dealerHand) - 1))) / 2.0 # Positions the group of cards dead center on x.
	for card in dealerHand:
		card.updateCardFace()
		card.position = Vector2(((1280.0/2.0) - dCardOffset + dealerPos), 150 + 20)
		card.set_z_index(dVisLayer)
		dVisLayer += 1
		dealerPos += 101
		print("Dealer" + card.getSuit() + " " + str(card.getValue()))

#Arranges the player's hand.
func arrangePlayerHand():
	var playerHand = playerRef.getHand()
	var playerPos = 0 # Shifts each of the cards over.
	var pVisLayer = 1 # Changes the order the cards are seen when overlaping.
	var pCardOffset = ((101 * (len(playerHand) - 1))) / 2.0
	for card in playerHand:
		card.updateCardFace()
		card.position = Vector2(((1280.0/2.0) - pCardOffset + playerPos), (720 - 150) - 20)
		card.set_z_index(pVisLayer)
		pVisLayer += 1
		playerPos += 101
		print(card.position)
		print("Player" + card.getSuit() + " " + str(card.getValue()))

func printScores():
	print("Player Score: " + str(handTotal(playerRef.getHand())))
	print("Dealer Score: " + str(handTotal(dealer.getHand())))

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout

#Signals from buttons.
func _on_start_button_pressed() -> void:
	startRound()

func _on_hit_button_pressed() -> void:
	playerHit()

func _on_stay_button_pressed() -> void:
	playerStay()
