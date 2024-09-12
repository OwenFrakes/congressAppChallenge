class_name Slide
extends Node2D

var expectedX = position.x

func _ready() -> void:
	
	#This object must have a child.
	var child = get_children()[0]
	
	var newX = 0 - child.size.x
	var newY = position.y
	position = Vector2(newX, newY)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Wait 2 seconds.
	await get_tree().create_timer(.5).timeout
	
	#Move the Node2D
	if(position.x < expectedX):
		position.x += 200 * delta
