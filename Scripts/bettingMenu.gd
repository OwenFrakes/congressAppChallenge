class_name BetMenu
extends MenuButton

var betNode

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	betNode = Betting.new()
	add_child(betNode)
	
	get_popup().add_item("Bet 1", 1)
	get_popup().add_item("Remove 1", 2)
	get_popup().id_pressed.connect(_on_pressed)

func _on_pressed(id: int):
	print(str(id))
	if(id == 1):
		betNode.add1()
	elif(id == 2):
		betNode.remove1()
	show_popup()
