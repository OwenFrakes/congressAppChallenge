class_name healthState
extends Sprite2D

#States should be, "Healthy", "Hungry", "Sick", "Hungry & Sick"
var state = "Healthy"
var stateLabel : Label
var feedBtn : CheckButton
var isFed = false
@onready var heatBtn = $"../HeaterBtn"
var isHeated = false
var expenses = 0
var controlExpenses = 0
var tempMoney = 0
@onready var homeControl = $"../HomeController"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Feed Button Code
	feedBtn = CheckButton.new()
	feedBtn.text = "Feed?"
	add_child(feedBtn)
	feedBtn.z_index += 1
	var feedX = 0 - (feedBtn.size.x / 2)
	var feedY = (texture.get_height() / 2.0)
	feedBtn.position = Vector2(feedX, feedY)
	
	# Label Code
	stateLabel = Label.new()
	stateLabel.text = state
	add_child(stateLabel)
	var labelX = 0 - (stateLabel.size.x / 2)
	var labelY = 0 - (texture.get_height()/2.0) - stateLabel.size.y
	stateLabel.position = Vector2(labelX, labelY)
	stateLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	tempMoney = StaticPlayerVariables.globalPlayerMoney

func passDay():
	checkFeed()
	checkHeat()
	if(!isFed && !isHeated):
		state = "Hungry & Sick"
	elif(!isFed):
		state = "Hungry"
	elif(!isHeated):
		state = "Sick"
	else:
		state = "Healthy"
	updateLabel()

func sendControlExpenses(newExpenses):
	controlExpenses = newExpenses

func sendTempMoney(newMoney):
	tempMoney = newMoney

func getExpenses():
	return expenses

func checkFeed():
	if(feedBtn.button_pressed):
		isFed = true
		expenses += 15
	else:
		isFed = false

func updateFeed():
	if(tempMoney - controlExpenses >= 15):
		feedBtn.disabled = false
	else:
		feedBtn.disabled = true

func checkHeat():
	if(heatBtn.button_pressed):
		isHeated = true
	else:
		isHeated = false

func updateLabel():
	stateLabel.text = state
	await get_tree().create_timer(0.01).timeout
	var labelX = 0 - (stateLabel.size.x / 2)
	var labelY = 0 - (texture.get_height()/2.0) - stateLabel.size.y
	stateLabel.position = Vector2(labelX, labelY)
