extends Node

@onready var moneyLabel = $"../moneyLabel"
@onready var totalExpensesLabel = $"../totalExpensesLabel"
@onready var dayLabel = $"../DayLabel"
@onready var family = [$"../SpouseSprite", $"../Child1Sprite", $"../Child2Sprite", $"../Child3Sprite"]
@onready var heatBtn = $"../HeaterBtn"
var tempMoney : int
var expenses : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.01).timeout
	
	tempMoney = StaticPlayerVariables.globalPlayerMoney
	updateLabels()
	updateHeatBtn()
	totalExpenses(true)

func passDay():
	StaticPlayerVariables.dayCount += 1
	#Total expenses first
	totalExpenses(true)
	
	#Solve the expenses
	tempMoney -= expenses
	StaticPlayerVariables.globalPlayerMoney -= expenses
	expenses = 0
	#StaticPlayerVariables.globalPlayerMoney = tempMoney
	
	#Update the labels/buttons. Updates wether the button can be pressed or not, to prevent negatives/debt.
	for person in family:
		person.updateFeed()
	updateHeatBtn()
	updateLabels()
	
	#Send the player home afterwards.
	var mainScene = load("res://Scenes/playerMovement.tscn")
	get_tree().change_scene_to_packed(mainScene)

func updateLabels():
	moneyLabel.text = "Player's Money: " + str(tempMoney) + "$."
	totalExpensesLabel.text = "Total Expenses: " + str(expenses)
	dayLabel.text = "Day: " + str(StaticPlayerVariables.dayCount)

func heatExpenses():
	#Called from check day, if heat is pressed, take money away.
	if(heatBtn.button_pressed):
		expenses += 30

func totalExpenses(_boolean):
	#print("totaled")
	
	expenses = 0
	#Total the expenses
	heatExpenses()
	for person in family:
		person.checkFeed()
	
	#Check what can be used / disabled
	updateHeatBtn()
	for person in family:
		person.updateFeed()

func updateHeatBtn():
	#Check if the player can even heat the house.
	if(!heatBtn.button_pressed && tempMoney - expenses < 30):
		heatBtn.disabled = true
		heatBtn.button_pressed = false
	else:
		heatBtn.disabled = false
