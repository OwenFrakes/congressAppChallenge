extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_tree_pretty()
	
func _on_spin_button_pressed() -> void:
	print("button preseed")
	#Randomize Position
	var leftPos = randi_range(1,8)
	var midPos = randi_range(1,8)
	var rightPos = randi_range(1,8)
	
	#Set Position (Left)
	if leftPos == 1:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 + 130
	elif leftPos == 2:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 + 85
	elif leftPos == 3:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 + 45
	elif leftPos == 4:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16
	elif leftPos == 5:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 40
	elif leftPos == 6:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 85
	elif leftPos == 7:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 125
	else:
		$"../ClippingMaskL/SpinnyPartL".position.y = 16 - 165
	
	#Set Position (Middle)
	if midPos == 1:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 + 130
	elif midPos == 2:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 + 85
	elif midPos == 3:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 + 45
	elif midPos == 4:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16
	elif midPos == 5:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 40
	elif midPos == 6:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 85
	elif midPos == 7:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 125
	else:
		$"../ClippingMaskM/SpinnyPartM".position.y = 16 - 165
	
	#Set Position (Right)
	if rightPos == 1:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 + 130
	elif rightPos == 2:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 + 85
	elif rightPos == 3:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 + 45
	elif rightPos == 4:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16
	elif rightPos == 5:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 40
	elif rightPos == 6:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 85
	elif rightPos == 7:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 125
	else:
		$"../ClippingMaskR/SpinnyPartR".position.y = 16 - 165

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
	
	
	
func _on_pressed() -> void:
	_on_spin_button_pressed() # Replace with function body.
