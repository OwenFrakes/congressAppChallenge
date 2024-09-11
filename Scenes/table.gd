extends Sprite2D
#create varables for all buttons
var bet_placed=false
var bet_amount=0
var bet=""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var one_node = $"1"
	one_node.connect("pressed", Callable(self, "one_button_pressed"))
	var red_node = $RED
	red_node.connect("pressed", Callable(self, "red_button_pressed"))
	var black_node = $Black
	black_node.connect("pressed", Callable(self, "black_button_pressed"))
	var button_node = $"../Button"
	button_node.connect("pressed", Callable(self, "on_button_pressed"))
	var reset_node = $"../Reset"
	reset_node.connect("pressed", Callable(self, "on_reset_pressed"))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	pass
	
func black_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet="black"

func on_button_pressed():
	self.hide()
	$Chip.hide()
func one_button_pressed():
	$Chip.show()
	bet_placed=true
func on_reset_pressed():
	self.show()
	bet_placed=false
	bet_amount=0
func red_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet="red"
