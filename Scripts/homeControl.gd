extends Node

@onready var moneyLabel = $"../moneyLabel"
@onready var dayLabel = $"../DayLabel"
@onready var family = [$"../SpouseSprite", $"../Child1Sprite", $"../Child2Sprite", $"../Child3Sprite"]
@onready var heatBtn = $"../HeaterBtn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	updateLabels()

func passDay():
	StaticPlayerVariables.dayCount += 1
	updateLabels()
	for person in family:
		person.passDay()

func updateLabels():
	moneyLabel.text = "Player's Money: " + str(StaticPlayerVariables.globalPlayerMoney) + "$."
	dayLabel.text = "Day: " + str(StaticPlayerVariables.dayCount)
