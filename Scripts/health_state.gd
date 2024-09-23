class_name healthState
extends Sprite2D

var health = 4
#States should be, "Healthy", "Hungry", "Sick", "Hungry & Sick"
var state = "Healthy"
var stateLabel : Label
var feedBtn : CheckButton
var isFed = false
@onready var heatBtn = $"../ElectricalBtn"
var isHeated = false
@onready var homeControl = $"../HomeController"
@onready var clickNoise = $"../ButtonClickNoise"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Feed Button Code
	feedBtn = CheckButton.new()
	feedBtn.text = "Feed?"
	feedBtn.theme = load("res://Resources/Themes/ButtonThemes/ButtonGeneralTheme.tres")
	add_child(feedBtn)
	feedBtn.z_index += 1
	var feedX = 0 - (feedBtn.size.x / 2)
	var feedY = (texture.get_height() / 2.0)
	feedBtn.position = Vector2(feedX, feedY)
	#feedBtn.set_size(Vector2(1,1))
	#Signals aren't that bad.
	feedBtn.toggled.connect(homeControl.totalExpenses)
	feedBtn.toggled.connect(buttonSound)
	
	# Label Code
	stateLabel = Label.new()
	stateLabel.text = state
	stateLabel.theme = load("res://Resources/Themes/LabelThemes/LabelGeneralTheme.tres")
	add_child(stateLabel)
	var labelX = 0 - (stateLabel.size.x / 2)
	var labelY = 0 - (texture.get_height()/2.0) - stateLabel.size.y
	stateLabel.position = Vector2(labelX, labelY)
	stateLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	

func passDay():
	
	if(health <= 0):
		state = "Dead"
		print("dead")
	else:
		#Update isFed and isHeated, then change state accordingly.
		checkFeed()
		checkHeat()
		if(!isFed && !isHeated):
			var random = randi_range(1,4)
			if(random == 4 || state.contains("Sick")):
				state = "Hungry & Sick"
			else:
				state = "Hungry"
		elif(!isFed):
			state = "Hungry"
		elif(!isHeated):
			var random = randi_range(1,4)
			if(random == 4  || state.contains("Sick")):
				state = "Sick"
			else:
				state = "Healthy"
		else:
			state = "Healthy"
			
		#Based on healthState, adjust health accordingly.
		match(state):
			"Healthy":
				health += 1
			"Sick":
				health -= 2
			"Hungry":
				health -= 1
			"Hungry & Sick":
				health -= 3
		
		#Debug, then update label.
		print(health)
		updateLabel()

func checkFeed():
	if(feedBtn.button_pressed && homeControl.tempMoney - homeControl.expenses >= 0):
		isFed = true
		homeControl.expenses += 5
	else:
		isFed = false

func updateFeed():
	if(!feedBtn.button_pressed && homeControl.tempMoney - homeControl.expenses < 15):
		feedBtn.disabled = true
	else:
		feedBtn.disabled = false

func checkHeat():
	if(heatBtn.button_pressed):
		isHeated = true
	else:
		isHeated = false

func updateLabel():
	#Make the label be in the right position, with the right text.
	stateLabel.text = state
	await get_tree().create_timer(0.01).timeout
	var labelX = 0 - (stateLabel.size.x / 2)
	var labelY = 0 - (texture.get_height()/2.0) - stateLabel.size.y
	stateLabel.position = Vector2(labelX, labelY)
	
	#Make the color of the family match their state.
	match(state):
		"Healthy":
			self_modulate = Color(1,1,1,1)
		"Sick":
			self_modulate = Color(110/255.0,146/255.0,76/255.0,1)
		"Hungry":
			self_modulate = Color(171/255.0,118/255.0,105/255.0,1)
		"Hungry & Sick":
			self_modulate = Color(156/255.0,129/255.0,67/255.0,1)
		"Dead":
			self_modulate = Color(1,1,1,0.3)

func buttonSound(_boolean):
	clickNoise.play()

func updateBtns(_boolean : bool):
	updateFeed()
