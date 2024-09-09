extends Node

@onready var moneyLabel = $"../moneyLabel"
@onready var dayLabel = $"../DayLabel"
@onready var family = [$"../SpouseSprite", $"../Child1Sprite", $"../Child2Sprite", $"../Child3Sprite"]
@onready var heatBtn = $"../HeaterBtn"
var tempMoney : int
var expenses : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tempMoney = StaticPlayerVariables.globalPlayerMoney
	updateLabels()
	updateHeatBtn()

func passDay():
	StaticPlayerVariables.dayCount += 1
	#Total expenses first
	heatExpenses()
	for person in family:
		person.passDay()
	
	#Solve the expenses
	tempMoney -= expenses
	expenses = 0
	
	#Update the labels/buttons. Updates wether the button can be pressed or not, to prevent negatives/debt.
	updateBtns()
	updateHeatBtn()
	updateLabels()

func updateBtns():
	#adds each persons expenses to the main expense
	for person in family:
		expenses += person.getExpenses()
	
	#updates each persons main expense and money values.
	for person in family:
		person.sendControlExpenses(expenses)
		person.sendTempMoney(tempMoney)
		person.updateFeed()

func updateLabels():
	moneyLabel.text = "Player's Money: " + str(tempMoney) + "$."
	dayLabel.text = "Day: " + str(StaticPlayerVariables.dayCount)

func heatExpenses():
	#Called from check day, if heat is pressed, take money away.
	if(heatBtn.button_pressed):
		expenses += 30

func updateHeatBtn():
	#Check if the player can even heat the house.
	if(tempMoney > 30):
		heatBtn.disabled = false
	else:
		heatBtn.button_pressed = false
		heatBtn.disabled = true
