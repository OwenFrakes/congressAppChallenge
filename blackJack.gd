extends Node

@onready var label = $"../Label"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var score = 0
	var card = randi_range(1,14)
	
	if(card == 14):
		score += 11
	elif(card > 10):
		score += 10
	else:
		score += card
		
	label.text = "Your current hand has a score of " + str(score) + "."
