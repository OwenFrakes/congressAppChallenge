extends Node

@onready var moneyLabel = $"../moneyLabel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	moneyLabel.text = "Player's Money: " + str(StaticPlayerVariables.globalPlayerMoney) + "$."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
