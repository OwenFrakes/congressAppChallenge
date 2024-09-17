class_name BetMenu
extends MenuButton

var betNode : Betting

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#Move the bettingMenu to a proper position.
	position = Vector2(30, 90)
	
	#Make the text player readable.
	text = "Betting Menu"
	flat = false
	
	#Get all the buttons setup.
	betNode = Betting.new()
	add_child(betNode)
	
	# 1's
	get_popup().add_item("Bet 1", 1)
	get_popup().add_item("Remove 1", 2)
	# 5's
	get_popup().add_item("Bet 5", 3)
	get_popup().add_item("Remove 5", 4)
	# 10's
	get_popup().add_item("Bet 10", 5)
	get_popup().add_item("Remove 10", 6)
	# 20's
	get_popup().add_item("Bet 20", 7)
	get_popup().add_item("Remove 20", 8)
	# 50's
	get_popup().add_item("Bet 50", 9)
	get_popup().add_item("Remove 50", 10)
	# 100's
	get_popup().add_item("Bet 100", 11)
	get_popup().add_item("Remove 100", 12)
	#Connect via signal, this stuff is a mess.
	get_popup().id_pressed.connect(_on_pressed)
	
	#Correct theme
	theme = load("res://Resources/Themes/ButtonThemes/ButtonGeneralTheme.tres")

func _on_pressed(id: int):
	print(str(id))
	#Add ID signals.
	match(id):
		#Beginning of add ids.
		1:
			betNode.add(1)
		3:
			betNode.add(5)
		5:
			betNode.add(10)
		7:
			betNode.add(20)
		9:
			betNode.add(50)
		11:
			betNode.add(100)
		#Begining of remove ids.
		2:
			betNode.remove(1)
		4:
			betNode.remove(5)
		6:
			betNode.remove(10)
		8:
			betNode.remove(20)
		10:
			betNode.remove(50)
		12:
			betNode.remove(100)

func getBetNode():
	return betNode

func getPlayerBet():
	return betNode.getPlayerBet()

func disable():
	disabled = true

func enable():
	disabled = false
