class_name Player extends Node 

var playerMoney = 0

func _ready() -> void:
	playerMoney = StaticPlayerVariables.globalPlayerMoney
	print(str(playerMoney))
