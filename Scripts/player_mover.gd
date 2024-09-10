extends Node

#PlayerMover is a node because it saves space to have a bunch of buttons send signals to this script
# to change scenes, than it would be to give 40 buttons their own script to change the scene.

#Changes the scene to blackjack.
func _on_black_jack_button_pressed() -> void:
	var newScene = load("res://Scenes/blackjack.tscn")
	get_tree().change_scene_to_packed(newScene)
	

func changeToMain():
	var mainScene = load("res://Scenes/playerMovement.tscn")
	get_tree().change_scene_to_packed(mainScene)

func _on_pressed() -> void:
	changeToMain()

func _on_home_button_pressed() -> void:
	var homeScene = load("res://Scenes/playerHome.tscn")
	get_tree().change_scene_to_packed(homeScene)
