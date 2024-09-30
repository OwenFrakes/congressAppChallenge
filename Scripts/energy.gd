class_name EnergyBorder
extends Sprite2D

func _ready():
	
	texture = load("res://Resources/Misc/fade2.png")
	centered = false
	scale = Vector2(4.942,3.711)
	z_index = 50
	
	while(StaticPlayerVariables.playerEnergy > 0):
		#Calculate Alpha
		var alpha = -(StaticPlayerVariables.playerEnergy/6.0) + 1
		
		self_modulate = Color(1,1,1,alpha)
		
		await get_tree().create_timer(0.1).timeout
	
	visible = false
