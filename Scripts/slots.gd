extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_tree_pretty()
	
func _on_spin_button_pressed() -> void:
	$"../ClippingMaskL/SpinnyPartL".position.y = randi_range(173, 682)
	$"../ClippingMaskM/SpinnyPartM".position.y = randi_range(173, 682)
	$"../ClippingMaskR/SpinnyPartR".position.y = randi_range(173, 682)
