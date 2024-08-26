extends Node



#Changes the scene to blackjack.
func _on_black_jack_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/blackjack.tscn")
