extends Sprite2D
#create varables for all bets
var bet_placed=false
var bet_amount=0
var bet_color=""
var bet_even_odd=""
var bet_1_to_18=""
var bet_12=""
var bet_2_to_1=""
var bet_number=""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#black
	var black_node = $Black
	black_node.connect("pressed", Callable(self, "black_button_pressed"))
	#red
	var red_node = $RED
	red_node.connect("pressed", Callable(self, "red_button_pressed"))
	#even
	var even_node = $EVEN
	even_node.connect("pressed", Callable(self, "even_button_pressed"))
	#odd
	var odd_node = $ODD
	odd_node.connect("pressed", Callable(self, "odd_button_pressed"))
	#1-18
	var to_18_node = $"1 to 18"
	to_18_node.connect("pressed", Callable(self, "to_18_button_pressed"))
	#19-36
	var to_36_node = $"19 to 36"
	to_36_node.connect("pressed", Callable(self, "to_36_button_pressed"))
	#1st 12
	var b1_12_node = $"1st 12"
	b1_12_node.connect("pressed", Callable(self, "b1_12_button_pressed"))
	#2nd 12
	var b2_12_node = $"2nd 12"
	b2_12_node.connect("pressed", Callable(self, "b2_12_button_pressed"))
	#3rd 12
	var b3_12_node = $"3rd 12"
	b3_12_node.connect("pressed", Callable(self, "b3_12_button_pressed"))
	#1st 2-1
	var b1_2_1_node = $"1st 2 to 1"
	b1_2_1_node.connect("pressed", Callable(self, "b1_2_1_button_pressed"))
	#2nd 2-1
	var b2_2_1_node = $"2nd 2 to 1"
	b2_2_1_node.connect("pressed", Callable(self, "b2_2_1_button_pressed"))
	#3rd 2-1
	var b3_2_1_node = $"3rd 2 to 1"
	b3_2_1_node.connect("pressed", Callable(self, "b3_2_1_button_pressed"))
	#spin
	var button_node = $"../Button"
	button_node.connect("pressed", Callable(self, "on_button_pressed"))
	#reset
	var reset_node = $"../Reset"
	reset_node.connect("pressed", Callable(self, "on_reset_pressed"))
	#1
	var one_node = $"1"
	one_node.connect("pressed", Callable(self, "one_button_pressed"))
	#2
	var b2_node = $"2"
	b2_node.connect("pressed", Callable(self, "b2_button_pressed"))
	#3
	var b3_node = $"3"
	b3_node.connect("pressed", Callable(self, "b3_button_pressed"))
	#4
	var b4_node = $"4"
	b4_node.connect("pressed", Callable(self, "b4_button_pressed"))
	#5
	var b5_node = $"5"
	b5_node.connect("pressed", Callable(self, "b5_button_pressed"))
	#6
	var b6_node = $"6"
	b6_node.connect("pressed", Callable(self, "b6_button_pressed"))
	#7
	var b7_node = $"7"
	b7_node.connect("pressed", Callable(self, "b7_button_pressed"))
	#8
	var b8_node =$"8"
	b8_node.connect("pressed", Callable(self, "b8_button_pressed"))
	#9
	var b9_node =$"9"
	b9_node.connect("pressed", Callable(self, "b9_button_pressed"))
	#10
	var b10_node = $"10"
	b10_node.connect("pressed", Callable(self, "b10_button_pressed"))
	#11
	var b11_node = $"11"
	b11_node.connect("pressed", Callable(self, "b11_button_pressed"))
	#12
	var b12_node =$"12"
	b12_node.connect("pressed", Callable(self, "b12_button_pressed"))
	#13
	var b13_node =$"13"
	b13_node.connect("pressed", Callable(self, "b13_button_pressed"))
	#14
	var b14_node = $"14"
	b14_node.connect("pressed", Callable(self, "b14_button_pressed"))
	#15
	var b15_node = $"15"
	b15_node.connect("pressed", Callable(self, "b15_button_pressed"))
	#16
	var b16_node =$"16"
	b16_node.connect("pressed", Callable(self, "b16_button_pressed"))
	#17
	var b17_node = $"17"
	b17_node.connect("pressed", Callable(self, "b17_button_pressed"))
	#18
	var b18_node = $"18"
	b18_node.connect("pressed", Callable(self, "b18_button_pressed"))
	#19
	var b19_node = $"19"
	b19_node.connect("pressed", Callable(self, "b19_button_pressed"))
	#20
	var b20_node = $"20"
	b20_node.connect("pressed", Callable(self, "b20_button_pressed"))
	#21
	var b21_node = $"21"
	b21_node.connect("pressed", Callable(self, "b21_button_pressed"))
	#22
	var b22_node = $"22"
	b22_node.connect("pressed", Callable(self, "b22_button_pressed"))
	#23
	var b23_node = $"23"
	b23_node.connect("pressed", Callable(self, "b23_button_pressed"))
	#24
	var b24_node = $"24"
	b24_node.connect("pressed", Callable(self, "b24_button_pressed"))
	#25
	var b25_node = $"25"
	b25_node.connect("pressed", Callable(self, "b25_button_pressed"))
	#26
	var b26_node = $"26"
	b26_node.connect("pressed", Callable(self, "b26_button_pressed"))
	#27
	var b27_node = $"27"
	b27_node.connect("pressed", Callable(self, "b27_button_pressed"))
	##28
	#var one_node = $"1"
	#one_node.connect("pressed", Callable(self, "one_button_pressed"))
	##29
	#var one_node = $"1"
	#one_node.connect("pressed", Callable(self, "one_button_pressed"))
	##30
	#var one_node = $"1"
	#one_node.connect("pressed", Callable(self, "one_button_pressed"))
	##31
	#var one_node = $"1"
	#one_node.connect("pressed", Callable(self, "one_button_pressed"))
	##32
	#var one_node = $"1"
	#one_node.connect("pressed", Callable(self, "one_button_pressed"))
	##33
	#var one_node = $"1"
	#one_node.connect("pressed", Callable(self, "one_button_pressed"))
	##34
	#var one_node = $"1"
	#one_node.connect("pressed", Callable(self, "one_button_pressed"))
	##35
	#var one_node = $"1"
	#one_node.connect("pressed", Callable(self, "one_button_pressed"))
	##36
	#var one_node = $"1"
	#one_node.connect("pressed", Callable(self, "one_button_pressed"))
	##0
	#var one_node = $"1"
	#one_node.connect("pressed", Callable(self, "one_button_pressed"))
	##00
	#var one_node = $"1"
	#one_node.connect("pressed", Callable(self, "one_button_pressed"))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	pass
#code for black 
func black_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_color="black"
#code for red
func red_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_color="red"
#code for even
func even_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_even_odd="even"
#code for odd
func odd_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_even_odd="odd"
#code for 1 to 18
func to_18_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_1_to_18="1-18"
#code for 19 to 36
func to_36_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_1_to_18="19-36"
#1st 12
func b1_12_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_12="1st"
#2nd 12
func b2_12_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_12="2nd"
#3rd 12
func b3_12_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_12="3rd"
#1st 2-1
func b1_2_1_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_2_to_1="1st"
#2nd 2-1
func b2_2_1_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_2_to_1="2nd"
#3rd 2-1
func b3_2_1_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_2_to_1="3rd"
#code to go to the wheel
func on_button_pressed():
	self.hide()
	$Chip.hide()
#code to reset the wheel
func on_reset_pressed():
	self.show()
	bet_placed=false
	bet_amount=0
#code for 1
func one_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="1"
