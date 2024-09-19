class_name ButtonNoise
extends Node

var noiseNode
var parent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	noiseNode = AudioStreamPlayer.new()
	noiseNode.stream = load("res://Resources/Sounds/blipSelect.wav")
	add_child(noiseNode)
	
	parent = get_parent()
	parent.pressed.connect(playSound)

func playSound():
	noiseNode.play()
