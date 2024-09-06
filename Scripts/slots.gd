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
	
	#Place the Other Half (Left)
	if $"../ClippingMaskL/SpinnyPartL".position.y > 16: 
		$"../ClippingMaskL/SpinnyPartTL".position.y = $"../ClippingMaskL/SpinnyPartL".position.y - 95
	elif $"../ClippingMaskL/SpinnyPartL".position.y < 16: #working
		$"../ClippingMaskL/SpinnyPartTL".position.y = $"../ClippingMaskL/SpinnyPartL".position.y + 300
		
	#Place the Other Half (Middle)
	if $"../ClippingMaskM/SpinnyPartM".position.y > 16:
		$"../ClippingMaskM/SpinnyPartTM".position.y = $"../ClippingMaskM/SpinnyPartM".position.y - 95
	elif $"../ClippingMaskM/SpinnyPartM".position.y < 16: #working
		$"../ClippingMaskM/SpinnyPartTM".position.y = $"../ClippingMaskM/SpinnyPartM".position.y + 300
		
	#Place the Other Half (Right)
	if $"../ClippingMaskR/SpinnyPartR".position.y > 16:
		$"../ClippingMaskR/SpinnyPartTR".position.y = $"../ClippingMaskR/SpinnyPartR".position.y - 95
	elif $"../ClippingMaskR/SpinnyPartR".position.y < 16: #working
		$"../ClippingMaskR/SpinnyPartTR".position.y = $"../ClippingMaskR/SpinnyPartR".position.y + 300
func _on_pressed() -> void:
	_on_spin_button_pressed() # Replace with function body.
