extends Node

var betMenu : BetMenu
var playerBet = 0
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_tree_pretty()
	betMenu = BetMenu.new()
	add_child(betMenu)
	betMenu.position.y = -300
	betMenu.position.x = 0
	
	$"../MoneyAmount".text = "Money: " + str(betMenu.getPlayerAmount())
	
func _on_spin_button_pressed() -> void:
	score = 10
	if(typeof(playerBet) == TYPE_NIL or betMenu.getPlayerBet() == 0  ):
		print("player needs to bet")
	else:
		playerBet = betMenu.getPlayerBet()
		#Randomize Position
		var leftPos = randi_range(1, 16)
		var midPos = randi_range(1, 16)
		var rightPos = randi_range(1, 16)
		var multiplier = 0
		#Set Position (Left)
		match (leftPos):
			1, 9:
				$"../ClippingMaskL/SpinnyPartL".position.y = 16 + 130
				$"../ClippingMaskL/SpinnyPartTL".position.y = 16 - 210
				print("cherry")
			2, 10:
				$"../ClippingMaskL/SpinnyPartL".position.y = 16 + 85
				$"../ClippingMaskL/SpinnyPartTL".position.y = 16 - 255
				print("orange")
			3, 11:
				$"../ClippingMaskL/SpinnyPartL".position.y = 16 + 45
				print("bell")
			4,12:
				$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 40
				print("coin")
			5, 13:
				$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 85
				print("diamond")
			6, 14:
				$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 125
				$"../ClippingMaskL/SpinnyPartTL".position.y = 16 + 215
				print("clover")
			7, 15:
				$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 165
				$"../ClippingMaskL/SpinnyPartTL".position.y = 16 + 175
				print("melon")
			16:
				$"../ClippingMaskL/SpinnyPartL".position.y = 16
				multiplier += 0.75
				print("seven")
		
		
		#Set Position (Middle)
		match (midPos):
			1, 9:
				$"../ClippingMaskM/SpinnyPartM".position.y = 16 + 130
				$"../ClippingMaskM/SpinnyPartTM".position.y = 16 - 210
				print("cherry")
			2, 10:
				$"../ClippingMaskM/SpinnyPartM".position.y = 16 + 85
				$"../ClippingMaskM/SpinnyPartTM".position.y = 16 - 255
				print("orange")
			3, 11:
				$"../ClippingMaskM/SpinnyPartM".position.y = 16 + 45
				print("bell")
			4,12:
				$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 40
				print("coin")
			5, 13:
				$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 85
				print("diamond")
			6, 14:
				$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 125
				$"../ClippingMaskM/SpinnyPartTM".position.y = 16 + 215
				print("clover")
			7, 15:
				$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 165
				$"../ClippingMaskM/SpinnyPartTM".position.y = 16 + 175
				print("melon")
			16:
				$"../ClippingMaskM/SpinnyPartM".position.y = 16
				multiplier += 0.75
				print("seven")
		
		#Set Position (Right)
		match (rightPos):
			1, 9:
				$"../ClippingMaskR/SpinnyPartR".position.y = 16 + 130
				$"../ClippingMaskR/SpinnyPartTR".position.y = 16 - 210
				print("cherry")
			2, 10:
				$"../ClippingMaskR/SpinnyPartR".position.y = 16 + 85
				$"../ClippingMaskR/SpinnyPartTR".position.y = 16 - 255
				print("orange")
			3, 11:
				$"../ClippingMaskR/SpinnyPartR".position.y = 16 + 45
				print("bell")
			4,12:
				$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 40
				print("coin")
			5, 13:
				$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 85
				print("diamond")
			6, 14:
				$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 125
				$"../ClippingMaskR/SpinnyPartTR".position.y = 16 + 215
				print("clover")
			7, 15:
				$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 165
				$"../ClippingMaskR/SpinnyPartTR".position.y = 16 + 175
				print("melon")
			16:
				$"../ClippingMaskR/SpinnyPartR".position.y = 16
				multiplier += 0.75
				print("seven")
		

		#Check for 777, if 777 double return amount, else return amount - 20 * multiplier
		if leftPos == 16 && midPos == 16 && rightPos == 16:
			betMenu.getBetNode().winBet(2*(.5*(1 + multiplier)))
		elif leftPos == midPos && midPos == rightPos:
			betMenu.getBetNode().winBet(1.5)
		elif leftPos == midPos or midPos == rightPos or leftPos == rightPos:
			betMenu.getBetNode().winBet(1.2)
		else:
			betMenu.getBetNode().winBet(.5*(1 + multiplier))

func _on_pressed() -> void:
	_on_spin_button_pressed() # Replace with function body.
	$"../MoneyAmount".text = "Money: " + str(betMenu.getPlayerAmount())
