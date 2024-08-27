extends Node

#PlayerMover is a node because it saves space to have a bunch of buttons send signals to this script
# to change scenes, than it would be to give 40 buttons their own script to change the scene.

#Changes the scene to blackjack.
func _on_black_jack_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/blackjack.tscn")
	
