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
var bet_top_line=""

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
	var b1_node = $"1"
	b1_node.connect("pressed", Callable(self, "b1_button_pressed"))
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
	#28
	var b28_node = $"28"
	b28_node.connect("pressed", Callable(self, "b28_button_pressed"))
	#29
	var b29_node = $"29"
	b29_node.connect("pressed", Callable(self, "b29_button_pressed"))
	#30
	var b30_node = $"30"
	b30_node.connect("pressed", Callable(self, "b30_button_pressed"))
	#31
	var b31_node = $"31"
	b31_node.connect("pressed", Callable(self, "b31_button_pressed"))
	#32
	var b32_node = $"32"
	b32_node.connect("pressed", Callable(self, "b32_button_pressed"))
	#33
	var b33_node = $"33"
	b33_node.connect("pressed", Callable(self, "b33_button_pressed"))
	#34
	var b34_node = $"34"
	b34_node.connect("pressed", Callable(self, "b34_button_pressed"))
	#35
	var b35_node = $"35"
	b35_node.connect("pressed", Callable(self, "b35_button_pressed"))
	#36
	var b36_node = $"36"
	b36_node.connect("pressed", Callable(self, "b36_button_pressed"))
	#0
	var b0_node = $"0"
	b0_node.connect("pressed", Callable(self, "b0_button_pressed"))
	#00
	var b00_node = $"00"
	b00_node.connect("pressed", Callable(self, "b00_button_pressed"))
	#Top line bet
	var bet_top_line_node = $"Top line bet"
	bet_top_line_node.connect("pressed", Callable(self, "bet_top_line_button_pressed"))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	var ball=$"../Ball".money
	var money=ball
	if bet_amount>money:
		$"../Button".hide()
#code to go to the wheel
func on_button_pressed():
	self.hide()
	$Chip.hide()
#code to reset the wheel
func on_reset_pressed():
	var wheel=$"../Roulette wheel"
	self.show()
	bet_placed=false
	bet_amount=0
	wheel.inside_bet=0
	#reset option button to show words
	$"Six line bet on six numbers".selected=0
	$"../Table/Split bet".selected=0
	$"../Table/Street bet".selected=0
	$"../Table/Corner bet".selected=0
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_number=""
	bet_top_line=""
#code for black 
func black_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_color="black"
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_number=""
	bet_top_line=""
#code for red
func red_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_color="red"
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_number=""
	bet_top_line=""
#code for even
func even_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_even_odd="even"
	bet_color=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_number=""
	bet_top_line=""
#code for odd
func odd_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_even_odd="odd"
	bet_color=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_number=""
	bet_top_line=""
#code for 1 to 18
func to_18_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_1_to_18="1-18"
	bet_color=""
	bet_even_odd=""
	bet_12=""
	bet_2_to_1=""
	bet_number=""
	bet_top_line=""
#code for 19 to 36
func to_36_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_1_to_18="19-36"
	bet_color=""
	bet_even_odd=""
	bet_12=""
	bet_2_to_1=""
	bet_number=""
	bet_top_line=""
#1st 12
func b1_12_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_12="1st"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_2_to_1=""
	bet_number=""
	bet_top_line=""
#2nd 12
func b2_12_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_12="2nd"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_2_to_1=""
	bet_number=""
	bet_top_line=""
#3rd 12
func b3_12_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_12="3rd"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_2_to_1=""
	bet_number=""
	bet_top_line=""
#1st 2-1
func b1_2_1_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_2_to_1="1st"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_number=""
	bet_top_line=""
#2nd 2-1
func b2_2_1_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_2_to_1="2nd"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_number=""
	bet_top_line=""
#3rd 2-1
func b3_2_1_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_2_to_1="3rd"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_number=""
	bet_top_line=""
#code for 1
func b1_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="1"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 2
func b2_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="2"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 3
func b3_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="3"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 4
func b4_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="4"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 5
func b5_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="5"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 6
func b6_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="6"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 7
func b7_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="7"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 8
func b8_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="8"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 9
func b9_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="9"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 10
func b10_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="10"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 11
func b11_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="11"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 12
func b12_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="12"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 13
func b13_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="13"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 14
func b14_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="14"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 15
func b15_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="15"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 16
func b16_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="16"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 17
func b17_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="17"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 18
func b18_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="18"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 19
func b19_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="19"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 20
func b20_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="20"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 21
func b21_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="21"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 22
func b22_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="22"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 23
func b23_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="23"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 24
func b24_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="24"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 25
func b25_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="25"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 26
func b26_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="26"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 27
func b27_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="27"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 28
func b28_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="28"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 29
func b29_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="29"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 30
func b30_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="30"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 31
func b31_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="31"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 32
func b32_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="32"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 33
func b33_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="33"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 34
func b34_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="34"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 35
func b35_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="35"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 36
func b36_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="36"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 0
func b0_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="0"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for 00
func b00_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_number="00"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_top_line=""
#code for top line bet
func bet_top_line_button_pressed():
	$Chip.show()
	bet_placed=true
	bet_amount+=1
	bet_top_line="yes"
	bet_color=""
	bet_even_odd=""
	bet_1_to_18=""
	bet_12=""
	bet_2_to_1=""
	bet_number=""
