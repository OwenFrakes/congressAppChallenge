extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_tree_pretty()
	
func _on_spin_button_pressed() -> void:
	$"../SpinnyPartL".position.y = randf_range(173, 682)
	$"../SpinnyPartM".position.y = randf_range(173, 682)
	$"../SpinnyPartR".position.y = randf_range(173, 682)
