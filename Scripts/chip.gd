class_name Chip extends AnimatedSprite2D 

var value = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_frames = load("res://Resources/SpriteSheets/chips.tres")
	

#Value can only be 1, 5, 10 ,20, 50, 100
func setValue(newValue):
	#This if is super ugly, but I don't care about finding a better way right now. - Owen F
	if(newValue == 1 || newValue == 5 || newValue == 10 || newValue == 20 || newValue == 50 || newValue == 100):
		value = newValue
	else:
		value = "Invalid"
		print("Invalid chip value")
	
	updateChipFace()

func updateChipFace():
	match(value):
		1:
			frame = 0
		5:
			frame = 1
		10:
			frame = 2
		20:
			frame = 3
		50:
			frame = 4
		100:
			frame = 5
		"Invalid":
			frame = 6
	

func getValue():
	return value
