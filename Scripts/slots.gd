extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_tree_pretty()
	
func _on_spin_button_pressed() -> void:
	#Randomize Position
	var leftPos = randi_range(1, 16)
	var midPos = randi_range(1, 16)
	var rightPos = randi_range(1, 16)
	var betAmount = 100
	var multiplier = 0
	
	#Set Position (Left)
	if leftPos == 1 or leftPos == 9:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 + 130
		$"../ClippingMaskL/SpinnyPartTL".position.y = 16 - 210
		print("cherry")
	elif leftPos == 2 or leftPos == 10:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 + 85
		$"../ClippingMaskL/SpinnyPartTL".position.y = 16 - 255
		print("orange")
	elif leftPos == 3 or leftPos == 11:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 + 45
		print("bell")
	elif leftPos == 4 or leftPos == 12:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 40
		print("coin")
	elif leftPos == 5 or leftPos == 13:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 85
		print("diamond")
	elif leftPos == 6 or leftPos == 14:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 125
		$"../ClippingMaskL/SpinnyPartTL".position.y = 16 + 215
		print("clover")
	elif leftPos == 7 or leftPos == 15:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 165
		$"../ClippingMaskL/SpinnyPartTL".position.y = 16 + 175
		print("melon")
	else:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16
		multiplier += 0.75
		print("seven")
	
	#Set Position (Middle)
	if midPos == 1 or midPos == 9:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 + 130
		$"../ClippingMaskM/SpinnyPartTM".position.y = 16 - 210
		print("cherry")
	elif midPos == 2 or midPos == 10:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 + 85
		$"../ClippingMaskM/SpinnyPartTM".position.y = 16 - 255
		print("orange")
	elif midPos == 3 or midPos == 11:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 + 45
		print("bell")
	elif midPos == 4 or midPos == 12:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 40
		print("coin")
	elif midPos == 5 or midPos == 13:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 85
		print("diamond")
	elif midPos == 6 or midPos == 14:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 125
		$"../ClippingMaskM/SpinnyPartTM".position.y = 16 + 215
		print("clover")
	elif midPos == 7 or midPos == 15:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 165
		$"../ClippingMaskM/SpinnyPartTM".position.y = 16 + 175
		print("melon")
	else:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16
		multiplier += 0.75
		print("seven")
	
	#Set Position (Right)
	if rightPos == 1 or rightPos == 9:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 + 130
		$"../ClippingMaskR/SpinnyPartTR".position.y = 16 - 210
		print("cherry")
	elif rightPos == 2 or rightPos == 10:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 + 85
		$"../ClippingMaskR/SpinnyPartTR".position.y = 16 - 255
		print("orange")
	elif rightPos == 3 or rightPos == 11:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 + 45
		print("bell")
	elif rightPos == 4 or rightPos == 12:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 40
		print("coin")
	elif rightPos == 5 or rightPos == 13:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 85
		print("diamond")
	elif rightPos == 6 or rightPos == 14:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 125
		$"../ClippingMaskR/SpinnyPartTR".position.y = 16 + 215
		print("clover")
	elif rightPos == 7 or rightPos == 15:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 165
		$"../ClippingMaskR/SpinnyPartTR".position.y = 16 + 175
		print("melon")
	else:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16
		multiplier += 0.75
		print("seven")

	#Check for 777, if 777 double return amount, else return amount - 20 * multiplier
	if leftPos == 16 && midPos == 16 && rightPos == 16:
		print(2*((betAmount - 20) *(1 + multiplier)))
	else:
		print((betAmount - 20) *(1 + multiplier))

func _on_pressed() -> void:
	_on_spin_button_pressed() # Replace with function body.
