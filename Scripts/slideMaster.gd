class_name SlideMaster
extends Node

@onready var children = get_children()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(.5).timeout
	
	for child in children:
		print("Go")
		child.shouldGo(true)
		await get_tree().create_timer(.5).timeout
