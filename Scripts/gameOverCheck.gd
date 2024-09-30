extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while(StaticPlayerVariables.globalPlayerMoney > 1 && (StaticPlayerVariables.child1Health > 0) && (StaticPlayerVariables.child2Health > 0) && (StaticPlayerVariables.child3Health > 0)):
		#print("Game Over Check")
		await get_tree().create_timer(1).timeout
	
	#Fade to black.
	var fadePanel = Panel.new()
	var styleOverride = load("res://Resources/Themes/fadeTheme.tres").duplicate()
	fadePanel.theme = styleOverride
	
	fadePanel.size = Vector2(1280,720)
	fadePanel.z_index = 10
	
	add_child(fadePanel)
	
	var alpha = 0.0
	var barrier = 100
	while(barrier >= 0):
		fadePanel.self_modulate = Color(0,0,0,alpha)
		alpha += 0.01
		barrier -= 1
		await get_tree().create_timer(0.01).timeout
	
	await get_tree().create_timer(1).timeout
	
	var endScene = load("res://Scenes/gameOver.tscn")
	get_tree().change_scene_to_packed(endScene)
	
	barrier = 100
	while(barrier >= 0):
		fadePanel.self_modulate = Color(0,0,0,alpha)
		alpha -= 0.01
		barrier -= 1
		await get_tree().create_timer(0.01).timeout
	
	fadePanel.hide()
