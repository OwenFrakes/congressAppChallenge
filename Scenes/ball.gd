extends Sprite2D
#determin if the ball is spinning
var spinning = false
#set how fast the ball spins 
var spin_velocity = 0
#make the ball slow down
var friction = 0.9
#test varables for betting
var inside_bet=0
var bet_amount=0
var bet_color="no"
var money=10
var bet_even_odd="no"
var bet_1_to_18="no"
var bet_12="no"
var bet_2_to_1="no"
var bet_number="no"
var bet_top_line="no"
var six_line=0
var street_bet=0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#make ball centered
	self.centered = true
	#create var for button
	var button_node = $"../Button"
	button_node.connect("pressed", Callable(self, "on_button_pressed"))	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if money<bet_amount:
		$"../Button".hide()
	#when ball is spinning
	if spinning:
		if spin_velocity!=0:
			#create var angle
			var current_angle = self.rotation
			#change the angle
			current_angle += spin_velocity * delta
			#slow the ball
			spin_velocity *= friction
			#make the ball stop when the velocity is too low
			if abs(spin_velocity) < 0.1:
				spin_velocity = 0
				spinning = false
			#set rotation to new current angle
			self.rotation = current_angle
		#when the ball stops spinning
		if !spinning:
			
			#find angle of the wheel
			var angle=$"../Roulette wheel".global_rotation_degrees
			#get angle of the ball
			var ball_angle= self.global_rotation_degrees*-1
			#combine the angles to find where the ball lands
			angle = angle+ball_angle
			#nake the angle an int
			var new_angle: int=angle
			#find the angle the ball stops at and prints the results
			if new_angle%360>=5 && new_angle%360<=12||new_angle%360>=-354 && new_angle%360<=-345:
				print("2, BLACK, EVEN, 1-18, 1st 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="2nd"
				bet_number="2"
				six_line=2
				street_bet=1
			elif new_angle%360>=13 && new_angle%360<=21||new_angle%360>=-344 && new_angle%360<=-334:
				print("14, RED, EVEN, 1-18, 2nd 12, 2nd 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="2nd"
				bet_2_to_1="2nd"
				bet_number="14"
				six_line=14
				street_bet=5
			elif new_angle%360>=22 && new_angle%360<=32||new_angle%360>=-333 && new_angle%360<=-325:
				print("35, BLACK, ODD, 19-36, 3rd 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="2nd"
				bet_number="35"
				six_line=35
				street_bet=12
			elif new_angle%360>=33 && new_angle%360<=44||new_angle%360>=-324 && new_angle%360<=-316:
				print("23, RED, ODD, 19-36, 2nd 12, 2nd 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="2nd"
				bet_2_to_1="2nd"
				bet_number="23"
				six_line=23
				street_bet=8
			elif new_angle%360>=45 && new_angle%360<=54||new_angle%360>=-315 && new_angle%360<=-304:
				print("4, BLACK, EVEN, 1-18, 1st 12, 1st 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="1st"
				bet_number="4"
				six_line=4
				street_bet=2
			elif new_angle%360>=55 && new_angle%360<=65||new_angle%360>=-303 && new_angle%360<=-295:
				print("16, RED, EVEN, 1-18, 2nd 12, 1st 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="2nd"
				bet_2_to_1="1st"
				bet_number="16"
				six_line=16
				street_bet=6
			elif new_angle%360>=66 && new_angle%360<=74||new_angle%360>=-294 && new_angle%360<=-285:
				print("33, BLACK, ODD, 19-36, 3rd 12, 3rd 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="3rd"
				bet_number="33"
				six_line=33
				street_bet=11
			elif new_angle%360>=75 && new_angle%360<=82||new_angle%360>=-284 && new_angle%360<=-278:
				print("21, RED, ODD, 19-36, 2nd 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="2nd"
				bet_2_to_1="3rd"
				bet_number="21"
				six_line=21
				street_bet=7
			elif new_angle%360>=83 && new_angle%360<=90||new_angle%360>=-277 && new_angle%360<=-269:
				print("6, BLACK, EVEN, 1-18, 1st 12, 3rd 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="3rd"
				bet_number="6"
				six_line=6
				street_bet=2
			elif new_angle%360>=91 && new_angle%360<=96||new_angle%360>=-268 && new_angle%360<=-260:
				print("18, RED, EVEN, 1-18, 2nd 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="2nd"
				bet_2_to_1="3rd"
				bet_number="18"
				six_line=18
				street_bet=6
			elif new_angle%360>=97 && new_angle%360<=104||new_angle%360>=-259 && new_angle%360<=-252:
				print("31, BLACK, ODD, 19-36, 3rd 12, 1st 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="1st"
				bet_number="31"
				six_line=31
				street_bet=11
			elif new_angle%360>=105 && new_angle%360<=117||new_angle%360>=-251 && new_angle%360<=-243:
				print("19, RED, ODD, 19-36, 2nd 12, 1st 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="2nd"
				bet_2_to_1="1st"
				bet_number="19"
				six_line=19
				street_bet=7
			elif new_angle%360>=118 && new_angle%360<=128||new_angle%360>=-242 && new_angle%360<=-232:
				print("8, BLACK, EVEN, 1-18, 1st 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="2nd"
				bet_number="8"
				six_line=8
				street_bet=3
			elif new_angle%360>=129 && new_angle%360<=139||new_angle%360>=-231 && new_angle%360<=-221:
				print("12, RED, EVEN, 1-18, 1st 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="3rd"
				bet_number="12"
				six_line=12
				street_bet=4
			elif new_angle%360>=140 && new_angle%360<=147||new_angle%360>=-220 && new_angle%360<=-212:
				print("29, BLACK, ODD, 19-36, 3rd 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="2nd"
				bet_number="29"
				six_line=29
				street_bet=10
			elif new_angle%360>=148 && new_angle%360<=154||new_angle%360>=-211 && new_angle%360<=-202:
				print("25, RED, ODD, 19-36, 3rd 12, 1st 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="1st"
				bet_number="25"
				six_line=25
				street_bet=9
			elif new_angle%360>=155 && new_angle%360<=164||new_angle%360>=-201 && new_angle%360<=-190:
				print("10, BLACK, EVEN, 1-18, 1st 12, 1st 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="1st"
				bet_number="10"
				six_line=10
				street_bet=4
			elif new_angle%360>=165 && new_angle%360<=172||new_angle%360>=-189 && new_angle%360<=-183:
				print("27, RED, ODD, 19-36, 3rd 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="3rd"
				bet_number="27"
				six_line=27
				street_bet=9
			elif new_angle%360>=-4 && new_angle%360<=4:
				print("0, Green")
				bet_number="0"
			elif new_angle%360>=-175 && new_angle%360<=-167||new_angle%360>=184 && new_angle%360<=192:
				print("1, RED, ODD, 1-18, 1st 12, 1st 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="1st"
				bet_number="1"
				six_line=1
				street_bet=1
			elif new_angle%360>=-166 && new_angle%360<=-158||new_angle%360>=193 && new_angle%360<=201:
				print("13, BLACK, ODD, 1-18, 2nd 12, 1st 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="2nd"
				bet_2_to_1="1st"
				bet_number="13"
				six_line=13
				street_bet=5
			elif new_angle%360>=-157 && new_angle%360<=-147||new_angle%360>=202 && new_angle%360<=212:
				print("36, RED, EVEN, 19-36, 3rd 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="3rd"
				bet_number="36"
				six_line=36
				street_bet=12
			elif new_angle%360>=-146 && new_angle%360<=-138||new_angle%360>=213 && new_angle%360<=222:
				print("24, BLACK, EVEN, 19-36, 2nd 12, 3rd 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="2nd"
				bet_2_to_1="3rd"
				bet_number="24"
				six_line=24
				street_bet=8
			elif new_angle%360>=-137 && new_angle%360<=-126||new_angle%360>=223 && new_angle%360<=233:
				print("3, RED, ODD, 1-18, 1st 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="3rd"
				bet_number="3"
				six_line=3
				street_bet=1
			elif new_angle%360>=-125 && new_angle%360<=-115||new_angle%360>=234 && new_angle%360<=244:
				print("15, BLACK, ODD, 1-18, 2nd 12, 3rd 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="2nd"
				bet_2_to_1="3rd"
				bet_number="15"
				six_line=15
				street_bet=5
			elif new_angle%360>=-114 && new_angle%360<=-106||new_angle%360>=245 && new_angle%360<=253:
				print("34, RED, EVEN, 19-36, 3rd 12, 1st 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="1st"
				bet_number="34"
				six_line=34
				street_bet=12
			elif new_angle%360>=-105 && new_angle%360<=-98||new_angle%360>=254 && new_angle%360<=261:
				print("22, BLACK, EVEN, 19-36, 2nd 12, 1st 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="2nd"
				bet_2_to_1="1st"
				bet_number="22"
				six_line=22
				street_bet=8
			elif new_angle%360>=-97 && new_angle%360<=-89||new_angle%360>=262 && new_angle%360<=269:
				print("5, RED, ODD, 1-18, 1st 12, 2nd 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="2nd"
				bet_number="5"
				six_line=5
				street_bet=2
			elif new_angle%360>=-88 && new_angle%360<=-81||new_angle%360>=270 && new_angle%360<=278:
				print("17, BLACK, ODD, 1-18, 2nd 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="2nd"
				bet_2_to_1="2nd"
				bet_number="17"
				six_line=17
				street_bet=6
			elif new_angle%360>=-80 && new_angle%360<=-73||new_angle%360>=279 && new_angle%360<=285:
				print("32, RED, EVEN, 19-36, 3rd 12, 2nd 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="2nd"
				bet_number="32"
				six_line=32
				street_bet=11
			elif new_angle%360>=-72 && new_angle%360<=-65||new_angle%360>=286 && new_angle%360<=295:
				print("20, BLACK, EVEN, 19-36, 2nd 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="2nd"
				bet_2_to_1="2nd"
				bet_number="20"
				six_line=20
				street_bet=7
			elif new_angle%360>=-64 && new_angle%360<=-54||new_angle%360>=296 && new_angle%360<=305:
				print("7, RED, ODD, 1-18, 1st 12, 1st 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="1st"
				bet_number="7"
				six_line=7
				street_bet=3
			elif new_angle%360>=-53 && new_angle%360<=-43||new_angle%360>=306 && new_angle%360<=316:
				print("11, BLACK, ODD, 1-18, 1st 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="2nd"
				bet_number="11"
				six_line=11
				street_bet=4
			elif new_angle%360>=-42 && new_angle%360<=-33||new_angle%360>=317 && new_angle%360<=325:
				print("30, RED, EVEN, 19-36, 3rd 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="3rd"
				bet_number="30"
				six_line=30
				street_bet=10
			elif new_angle%360>=-32 && new_angle%360<=-26||new_angle%360>=326 && new_angle%360<=334:
				print("26, BLACK, EVEN, 19-36, 3rd 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="2nd"
				bet_number="26"
				six_line=26
				street_bet=9
			elif new_angle%360>=-25 && new_angle%360<=-15||new_angle%360>=335 && new_angle%360<=345:
				print("9, RED, ODD, 1-18, 1st 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="3rd"
				bet_number="9"
				six_line=9
				street_bet=3
			elif new_angle%360>=-14 && new_angle%360<=-5||new_angle%360>=346 && new_angle%360<=354:
				print("28, BLACK, EVEN, 19-36, 3rd 12, 1st 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="1st"
				bet_number="28"
				six_line=28
				street_bet=10
			else: 
				print("00, Green")
				bet_number="00"
			var table=$"../Table"
			var wheel=$"../Roulette wheel"
			bet_amount=table.bet_amount
			inside_bet=wheel.inside_bet
			if bet_color==table.bet_color:
				#pays 1-1
				money+=bet_amount
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif bet_even_odd==table.bet_even_odd:
				#pays 1-1
				money+=bet_amount
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif bet_1_to_18==table.bet_1_to_18:
				#pays 1-1
				money+=bet_amount
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif bet_12==table.bet_12:
				#pays 2-1
				money+=bet_amount*2
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif bet_2_to_1==table.bet_2_to_1:
				#pays 2-1
				money+=bet_amount*2
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif bet_number==table.bet_number:
				#pays 35-1
				money+=bet_amount*35
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif table.bet_top_line=="yes"&&bet_number=="0"||table.bet_top_line=="yes"&&bet_number=="00"||table.bet_top_line=="yes"&&bet_number=="1"||table.bet_top_line=="yes"&&bet_number=="2"||table.bet_top_line=="yes"&&bet_number=="3":
				#pays 6-1
				money+=bet_amount*6
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line>0&&six_line<7)&&wheel.six_line==1:
				#pays 5-1
				money+=inside_bet*5
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line>3&&six_line<10)&&wheel.six_line==2:
				#pays 5-1
				money+=inside_bet*5
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line>6&&six_line<13)&&wheel.six_line==3:
				#pays 5-1
				money+=inside_bet*5
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line>9&&six_line<16)&&wheel.six_line==4:
				#pays 5-1
				money+=inside_bet*5
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line>12&&six_line<19)&&wheel.six_line==5:
				#pays 5-1
				money+=inside_bet*5
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line>15&&six_line<22)&&wheel.six_line==6:
				#pays 5-1
				money+=inside_bet*5
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line>18&&six_line<25)&&wheel.six_line==7:
				#pays 5-1
				money+=inside_bet*5
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line>21&&six_line<28)&&wheel.six_line==8:
				#pays 5-1
				money+=inside_bet*5
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line>24&&six_line<31)&&wheel.six_line==9:
				#pays 5-1
				money+=inside_bet*5
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line>27&&six_line<34)&&wheel.six_line==10:
				#pays 5-1
				money+=inside_bet*5
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line>30&&six_line<37)&&wheel.six_line==11:
				#pays 5-1
				money+=inside_bet*5
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif wheel.street_bet==street_bet:
				#pays 11-1
				money+=inside_bet*11
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==1||six_line==2||six_line==5||six_line==4)&&wheel.corner_bet==1:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==3||six_line==2||six_line==5||six_line==6)&&wheel.corner_bet==2:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==4||six_line==5||six_line==7||six_line==8)&&wheel.corner_bet==3:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==8||six_line==9||six_line==5||six_line==6)&&wheel.corner_bet==4:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==7||six_line==8||six_line==10||six_line==11)&&wheel.corner_bet==5:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==8||six_line==9||six_line==11||six_line==12)&&wheel.corner_bet==6:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==10||six_line==11||six_line==13||six_line==14)&&wheel.corner_bet==7:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==11||six_line==12||six_line==15||six_line==14)&&wheel.corner_bet==8:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==13||six_line==14||six_line==17||six_line==16)&&wheel.corner_bet==9:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==14||six_line==15||six_line==17||six_line==18)&&wheel.corner_bet==10:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==16||six_line==17||six_line==19||six_line==20)&&wheel.corner_bet==11:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==18||six_line==17||six_line==21||six_line==20)&&wheel.corner_bet==12:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==19||six_line==20||six_line==22||six_line==23)&&wheel.corner_bet==13:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==20||six_line==21||six_line==23||six_line==24)&&wheel.corner_bet==14:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==22||six_line==23||six_line==25||six_line==26)&&wheel.corner_bet==15:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==23||six_line==24||six_line==26||six_line==27)&&wheel.corner_bet==16:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==25||six_line==26||six_line==28||six_line==29)&&wheel.corner_bet==17:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==26||six_line==27||six_line==29||six_line==30)&&wheel.corner_bet==18:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==28||six_line==29||six_line==31||six_line==32)&&wheel.corner_bet==19:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==29||six_line==30||six_line==32||six_line==33)&&wheel.corner_bet==20:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==31||six_line==32||six_line==34||six_line==35)&&wheel.corner_bet==21:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==32||six_line==33||six_line==35||six_line==36)&&wheel.corner_bet==22:
				#pays 8-1
				money+=inside_bet*8
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==1||six_line==2)&&wheel.split_bet==1:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==2||six_line==3)&&wheel.split_bet==2:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==4||six_line==5)&&wheel.split_bet==3:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==5||six_line==6)&&wheel.split_bet==4:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==7||six_line==8)&&wheel.split_bet==5:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==8||six_line==9)&&wheel.split_bet==6:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==10||six_line==11)&&wheel.split_bet==7:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==11||six_line==12)&&wheel.split_bet==8:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==13||six_line==14)&&wheel.split_bet==9:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==14||six_line==15)&&wheel.split_bet==10:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==16||six_line==17)&&wheel.split_bet==11:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==17||six_line==18)&&wheel.split_bet==12:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==19||six_line==20)&&wheel.split_bet==13:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==20||six_line==21)&&wheel.split_bet==14:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==22||six_line==23)&&wheel.split_bet==15:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==23||six_line==24)&&wheel.split_bet==16:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==25||six_line==26)&&wheel.split_bet==17:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==26||six_line==27)&&wheel.split_bet==18:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==28||six_line==29)&&wheel.split_bet==19:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==29||six_line==30)&&wheel.split_bet==20:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==31||six_line==32)&&wheel.split_bet==21:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==32||six_line==33)&&wheel.split_bet==22:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==34||six_line==35)&&wheel.split_bet==23:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==35||six_line==36)&&wheel.split_bet==24:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==1||six_line==4)&&wheel.split_bet==25:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==2||six_line==5)&&wheel.split_bet==26:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==3||six_line==6)&&wheel.split_bet==27:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==4||six_line==7)&&wheel.split_bet==28:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==5||six_line==8)&&wheel.split_bet==29:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==6||six_line==9)&&wheel.split_bet==30:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==7||six_line==10)&&wheel.split_bet==31:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==8||six_line==11)&&wheel.split_bet==32:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==9||six_line==12)&&wheel.split_bet==33:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==10||six_line==13)&&wheel.split_bet==34:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==11||six_line==14)&&wheel.split_bet==35:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==12||six_line==15)&&wheel.split_bet==36:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==13||six_line==16)&&wheel.split_bet==37:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==14||six_line==17)&&wheel.split_bet==38:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==15||six_line==18)&&wheel.split_bet==39:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==16||six_line==19)&&wheel.split_bet==40:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==17||six_line==20)&&wheel.split_bet==41:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==18||six_line==21)&&wheel.split_bet==42:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==19||six_line==22)&&wheel.split_bet==43:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==20||six_line==23)&&wheel.split_bet==44:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==21||six_line==24)&&wheel.split_bet==45:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==22||six_line==25)&&wheel.split_bet==46:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==23||six_line==26)&&wheel.split_bet==47:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==24||six_line==27)&&wheel.split_bet==48:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==25||six_line==28)&&wheel.split_bet==49:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==26||six_line==29)&&wheel.split_bet==50:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==27||six_line==30)&&wheel.split_bet==51:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==28||six_line==31)&&wheel.split_bet==52:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==29||six_line==32)&&wheel.split_bet==53:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==30||six_line==33)&&wheel.split_bet==54:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==31||six_line==34)&&wheel.split_bet==55:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==32||six_line==35)&&wheel.split_bet==56:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			elif (six_line==33||six_line==36)&&wheel.split_bet==57:
				#pays 17-1
				money+=inside_bet*17
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				table.bet_amount=0
				wheel.inside_bet=0
				print(money)
			else:
				money-=abs(bet_amount)
				money-=abs(inside_bet)
				table.bet_amount=0
				wheel.inside_bet=0
				bet_color="no"
				bet_even_odd="no"
				bet_1_to_18="no"
				bet_12="no"
				bet_2_to_1="no"
				bet_number="no"
				bet_top_line="no"
				six_line=0
				street_bet=0
				bet_amount=0
				inside_bet=0
				print(money)
			
func on_button_pressed():
	#create a random power for the ball
	spin_velocity = randf_range(-1000,-10000)
	spinning = true
