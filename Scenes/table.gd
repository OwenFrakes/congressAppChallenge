extends Sprite2D
#create varables for all buttons
var bet=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var one_node = $"1"
	one_node.connect("pressed", Callable(self, "one_button_pressed"))
	var button_node = $"../Button"
	button_node.connect("pressed", Callable(self, "on_button_pressed"))
	var reset_node = $"../Reset"
	reset_node.connect("pressed", Callable(self, "on_reset_pressed"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	pass
	
func on_button_pressed():
	self.hide()
	$Chip.hide()
func one_button_pressed():
	$Chip.show()
	bet=true
func on_reset_pressed():
	self.show()
	bet=false
