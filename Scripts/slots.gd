extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_tree_pretty()
	
func _on_spin_button_pressed() -> void:
	print("button preseed")
	#Randomize Base Positions
	$"../ClippingMaskL/SpinnyPartL".position.y = randi_range(-173,189)
	$"../ClippingMaskM/SpinnyPartM".position.y = randi_range(-173,189)
	$"../ClippingMaskR/SpinnyPartR".position.y = randi_range(-173,189)
	
	var SpinnyPartL = $"../ClippingMaskL/SpinnyPartL".position.y
	var SpinnyPartM = $"../ClippingMaskM/SpinnyPartM".position.y
	var SpinnyPartR = $"../ClippingMaskR/SpinnyPartR".position.y
	#Place the Other Half (Left)
	if SpinnyPartL > 16: 
		$"../ClippingMaskL/SpinnyPartTL".position.y = SpinnyPartL - 95
	elif SpinnyPartL < 16: #working
		$"../ClippingMaskL/SpinnyPartTL".position.y = SpinnyPartL + 300
		
	#Place the Other Half (Middle)
	if SpinnyPartM > 16:
		$"../ClippingMaskM/SpinnyPartTM".position.y = SpinnyPartM - 95
	elif SpinnyPartM < 16: #working
		$"../ClippingMaskM/SpinnyPartTM".position.y = SpinnyPartM + 300
		
	#Place the Other Half (Right)
	if SpinnyPartR > 16:
		$"../ClippingMaskR/SpinnyPartTR".position.y = SpinnyPartR - 95
	elif SpinnyPartR < 16: #working
		$"../ClippingMaskR/SpinnyPartTR".position.y = SpinnyPartR + 300
func _on_pressed() -> void:
	_on_spin_button_pressed() # Replace with function body.
