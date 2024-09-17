extends Label

func _process(_delta: float) -> void:
	await get_tree().create_timer(0.1).timeout
	text = "Player Money: " + str(StaticPlayerVariables.globalPlayerMoney)
	print("ran")
