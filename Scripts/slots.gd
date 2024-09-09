extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_tree_pretty()
	
func _on_spin_button_pressed() -> void:
	print("button preseed")
	#Randomize Position
	var leftPos = 2
	var midPos = 2
	var rightPos = 2
	var betAmount = 100
	var multiplier = 0
	
	#Set Position (Left)
	if leftPos == 1 or leftPos == 9:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 + 130
	elif leftPos == 2 or leftPos == 10:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 + 185
	elif leftPos == 3 or leftPos == 11:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 + 45
	elif leftPos == 4 or leftPos == 12:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 40
	elif leftPos == 5 or leftPos == 13:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 85
	elif leftPos == 6 or leftPos == 14:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 125
	elif leftPos == 7 or leftPos == 15:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 165
	else:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16
		multiplier += 0.75
	
	#Set Position (Middle)
	if midPos == 1 or midPos == 9:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 + 130
	elif midPos == 2 or midPos == 10:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 + 185
	elif midPos == 3 or midPos == 11:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 + 45
	elif midPos == 4 or midPos == 12:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 40
	elif midPos == 5 or midPos == 13:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 85
	elif midPos == 6 or midPos == 14:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 125
	elif midPos == 7 or midPos == 15:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 165
	else:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16
		multiplier += 0.75
	
	#Set Position (Right)
	if rightPos == 1 or rightPos == 9:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 + 130
	elif rightPos == 2 or rightPos == 10:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 + 185
	elif rightPos == 3 or rightPos == 11:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 + 45
	elif rightPos == 4 or rightPos == 12:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 40
	elif rightPos == 5 or rightPos == 13:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 85
	elif rightPos == 6 or rightPos == 14:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 125
	elif rightPos == 7 or rightPos == 15:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 165
	else:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16
		multiplier += 0.75

	var SpinnyPartL = $"../ClippingMaskL/SpinnyPartL".position.y
	var SpinnyPartM = $"../ClippingMaskM/SpinnyPartM".position.y
	var SpinnyPartR = $"../ClippingMaskR/SpinnyPartR".position.y
	
	#Place the Other Half (Left)
	if SpinnyPartL > 16: 
		$"../ClippingMaskL/SpinnyPartTL".position.y = SpinnyPartL - 95
	elif SpinnyPartL <= 16: #working
		$"../ClippingMaskL/SpinnyPartTL".position.y = SpinnyPartL + 300
		
	#Place the Other Half (Middle)
	if SpinnyPartM > 16:
		$"../ClippingMaskM/SpinnyPartTM".position.y = SpinnyPartM - 95
	elif SpinnyPartM <= 16: #working
		$"../ClippingMaskM/SpinnyPartTM".position.y = SpinnyPartM + 300
		
	#Place the Other Half (Right)
	if SpinnyPartR > 16:
		$"../ClippingMaskR/SpinnyPartTR".position.y = SpinnyPartR - 95
	elif SpinnyPartR <= 16: #working
		$"../ClippingMaskR/SpinnyPartTR".position.y = SpinnyPartR + 300
	
	print((betAmount - 20) *(1 + multiplier))

func _on_pressed() -> void:
	_on_spin_button_pressed() # Replace with function body.
