extends Node

func _ready():
	
	#var tiredBorder = Sprite2D.new()
	#tiredBorder.texture = load("res://Resources/Misc/fade2.png")
	#tiredBorder.scale = Vector2(4.942, 3.711)
	#tiredBorder.centered = false
	#add_child(tiredBorder)
	#tiredBorder.z_index = 50
	
	#var alpha = -(StaticPlayerVariables.playerEnergy/6.0) + 1
	
	while(true):
		#tiredBorder.modulate = Color(1,1,1,alpha)
		
		await get_tree().create_timer(0.01).timeout
