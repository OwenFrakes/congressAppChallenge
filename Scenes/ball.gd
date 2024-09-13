extends Sprite2D
#determin if the ball is spinning
var spinning = false
#set how fast the ball spins 
var spin_velocity = 0
#make the ball slow down
var friction = 0.9
#test varables for betting
var bet_amount=0
var bet_color="no"
var money=10
var bet_even_odd="no"
var bet_1_to_18="no"
var bet_12="no"
var bet_2_to_1="no"
var bet_number="no"
var bet_top_line="no"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#make ball centered
	self.centered = true
	#create var for button
	var button_node = $"../Button"
	button_node.connect("pressed", Callable(self, "on_button_pressed"))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
			elif new_angle%360>=13 && new_angle%360<=21||new_angle%360>=-344 && new_angle%360<=-334:
				print("14, RED, EVEN, 1-18, 2nd 12, 2nd 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="2nd"
				bet_2_to_1="2nd"
				bet_number="14"
			elif new_angle%360>=22 && new_angle%360<=32||new_angle%360>=-333 && new_angle%360<=-325:
				print("35, BLACK, ODD, 19-36, 3rd 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="2nd"
				bet_number="35"
			elif new_angle%360>=33 && new_angle%360<=44||new_angle%360>=-324 && new_angle%360<=-316:
				print("23, RED, ODD, 19-36, 2nd 12, 2nd 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="2nd"
				bet_2_to_1="2nd"
				bet_number="23"
			elif new_angle%360>=45 && new_angle%360<=54||new_angle%360>=-315 && new_angle%360<=-304:
				print("4, BLACK, EVEN, 1-18, 1st 12, 1st 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="1st"
				bet_number="4"
			elif new_angle%360>=55 && new_angle%360<=65||new_angle%360>=-303 && new_angle%360<=-295:
				print("16, RED, EVEN, 1-18, 2nd 12, 1st 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="2nd"
				bet_2_to_1="1st"
				bet_number="16"
			elif new_angle%360>=66 && new_angle%360<=74||new_angle%360>=-294 && new_angle%360<=-285:
				print("33, BLACK, ODD, 19-36, 3rd 12, 3rd 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="3rd"
				bet_number="33"
			elif new_angle%360>=75 && new_angle%360<=82||new_angle%360>=-284 && new_angle%360<=-278:
				print("21, RED, ODD, 19-36, 2nd 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="2nd"
				bet_2_to_1="3rd"
				bet_number="21"
			elif new_angle%360>=83 && new_angle%360<=90||new_angle%360>=-277 && new_angle%360<=-269:
				print("6, BLACK, EVEN, 1-18, 1st 12, 3rd 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="3rd"
				bet_number="6"
			elif new_angle%360>=91 && new_angle%360<=96||new_angle%360>=-268 && new_angle%360<=-260:
				print("18, RED, EVEN, 1-18, 2nd 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="2nd"
				bet_2_to_1="3rd"
				bet_number="18"
			elif new_angle%360>=97 && new_angle%360<=104||new_angle%360>=-259 && new_angle%360<=-252:
				print("31, BLACK, ODD, 19-36, 3rd 12, 1st 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="1st"
				bet_number="31"
			elif new_angle%360>=105 && new_angle%360<=117||new_angle%360>=-251 && new_angle%360<=-243:
				print("19, RED, ODD, 19-36, 2nd 12, 1st 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="2nd"
				bet_2_to_1="1st"
				bet_number="19"
			elif new_angle%360>=118 && new_angle%360<=128||new_angle%360>=-242 && new_angle%360<=-232:
				print("8, BLACK, EVEN, 1-18, 1st 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="2nd"
				bet_number="8"
			elif new_angle%360>=129 && new_angle%360<=139||new_angle%360>=-231 && new_angle%360<=-221:
				print("12, RED, EVEN, 1-18, 1st 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="3rd"
				bet_number="12"
			elif new_angle%360>=140 && new_angle%360<=147||new_angle%360>=-220 && new_angle%360<=-212:
				print("29, BLACK, ODD, 19-36, 3rd 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="2nd"
				bet_number="29"
			elif new_angle%360>=148 && new_angle%360<=154||new_angle%360>=-211 && new_angle%360<=-202:
				print("25, RED, ODD, 19-36, 3rd 12, 1st 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="1st"
				bet_number="25"
			elif new_angle%360>=155 && new_angle%360<=164||new_angle%360>=-201 && new_angle%360<=-190:
				print("10, BLACK, EVEN, 1-18, 1st 12, 1st 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="1st"
				bet_number="10"
			elif new_angle%360>=165 && new_angle%360<=172||new_angle%360>=-189 && new_angle%360<=-183:
				print("27, RED, ODD, 19-36, 3rd 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="3rd"
				bet_number="27"
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
			elif new_angle%360>=-166 && new_angle%360<=-158||new_angle%360>=193 && new_angle%360<=201:
				print("13, BLACK, ODD, 1-18, 2nd 12, 1st 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="2nd"
				bet_2_to_1="1st"
				bet_number="13"
			elif new_angle%360>=-157 && new_angle%360<=-147||new_angle%360>=202 && new_angle%360<=212:
				print("36, RED, EVEN, 19-36, 3rd 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="3rd"
				bet_number="36"
			elif new_angle%360>=-146 && new_angle%360<=-138||new_angle%360>=213 && new_angle%360<=222:
				print("24, BLACK, EVEN, 19-36, 2nd 12, 3rd 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="2nd"
				bet_2_to_1="3rd"
				bet_number="24"
			elif new_angle%360>=-137 && new_angle%360<=-126||new_angle%360>=223 && new_angle%360<=233:
				print("3, RED, ODD, 1-18, 1st 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="3rd"
				bet_number="3"
			elif new_angle%360>=-125 && new_angle%360<=-115||new_angle%360>=234 && new_angle%360<=244:
				print("15, BLACK, ODD, 1-18, 2nd 12, 3rd 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="2nd"
				bet_2_to_1="3rd"
				bet_number="15"
			elif new_angle%360>=-114 && new_angle%360<=-106||new_angle%360>=245 && new_angle%360<=253:
				print("34, RED, EVEN, 19-36, 3rd 12, 1st 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="1st"
				bet_number="34"
			elif new_angle%360>=-105 && new_angle%360<=-98||new_angle%360>=254 && new_angle%360<=261:
				print("22, BLACK, EVEN, 19-36, 2nd 12, 1st 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="2nd"
				bet_2_to_1="1st"
				bet_number="22"
			elif new_angle%360>=-97 && new_angle%360<=-89||new_angle%360>=262 && new_angle%360<=269:
				print("5, RED, ODD, 1-18, 1st 12, 2nd 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="2nd"
				bet_number="5"
			elif new_angle%360>=-88 && new_angle%360<=-81||new_angle%360>=270 && new_angle%360<=278:
				print("17, BLACK, ODD, 1-18, 2nd 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="2nd"
				bet_2_to_1="2nd"
				bet_number="17"
			elif new_angle%360>=-80 && new_angle%360<=-73||new_angle%360>=279 && new_angle%360<=285:
				print("32, RED, EVEN, 19-36, 3rd 12, 2nd 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="2nd"
				bet_number="32"
			elif new_angle%360>=-72 && new_angle%360<=-65||new_angle%360>=286 && new_angle%360<=295:
				print("20, BLACK, EVEN, 19-36, 2nd 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="2nd"
				bet_2_to_1="2nd"
				bet_number="20"
			elif new_angle%360>=-64 && new_angle%360<=-54||new_angle%360>=296 && new_angle%360<=305:
				print("7, RED, ODD, 1-18, 1st 12, 1st 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="1st"
				bet_number="7"
			elif new_angle%360>=-53 && new_angle%360<=-43||new_angle%360>=306 && new_angle%360<=316:
				print("11, BLACK, ODD, 1-18, 1st 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="2nd"
				bet_number="11"
			elif new_angle%360>=-42 && new_angle%360<=-33||new_angle%360>=317 && new_angle%360<=325:
				print("30, RED, EVEN, 19-36, 3rd 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="3rd"
				bet_number="30"
			elif new_angle%360>=-32 && new_angle%360<=-26||new_angle%360>=326 && new_angle%360<=334:
				print("26, BLACK, EVEN, 19-36, 3rd 12, 2nd 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="2nd"
				bet_number="26"
			elif new_angle%360>=-25 && new_angle%360<=-15||new_angle%360>=335 && new_angle%360<=345:
				print("9, RED, ODD, 1-18, 1st 12, 3rd 2 to 1")
				bet_color="red"
				bet_even_odd="odd"
				bet_1_to_18="1-18"
				bet_12="1st"
				bet_2_to_1="3rd"
				bet_number="9"
			elif new_angle%360>=-14 && new_angle%360<=-5||new_angle%360>=346 && new_angle%360<=354:
				print("28, BLACK, EVEN, 19-36, 3rd 12, 1st 2 to 1")
				bet_color="black"
				bet_even_odd="even"
				bet_1_to_18="19-36"
				bet_12="3rd"
				bet_2_to_1="1st"
				bet_number="28"
			else: 
				print("00, Green")
				bet_number="00"
			var table=$"../Table"
			bet_amount=table.bet_amount
			if bet_color==table.bet_color:
				#pays 1-1
				money+=bet_amount
				bet_color="no"
				table.bet_amount=0
				print(money)
			elif bet_even_odd==table.bet_even_odd:
				#pays 1-1
				money+=bet_amount
				bet_even_odd="no"
				table.bet_amount=0
				print(money)
			elif bet_1_to_18==table.bet_1_to_18:
				#pays 1-1
				money+=bet_amount
				bet_1_to_18="no"
				table.bet_amount=0
				print(money)
			elif bet_12==table.bet_12:
				#pays 2-1
				money+=bet_amount*2
				bet_12="no"
				table.bet_amount=0
				print(money)
			elif bet_2_to_1==table.bet_2_to_1:
				#pays 2-1
				money+=bet_amount*2
				bet_2_to_1="no"
				table.bet_amount=0
				print(money)
			elif bet_number==table.bet_number:
				#pays 35-1
				money+=bet_amount*35
				bet_number="no"
				table.bet_amount=0
				print(money)
			elif table.bet_top_line=="yes"&&bet_number=="0"||table.bet_top_line=="yes"&&bet_number=="00"||table.bet_top_line=="yes"&&bet_number=="1"||table.bet_top_line=="yes"&&bet_number=="2"||table.bet_top_line=="yes"&&bet_number=="3":
				#pays 6-1
				money+=bet_amount*6
				bet_number="no"
				table.bet_amount=0
				print(money)
			else:
				money-=bet_amount
				table.bet_amount=0
				print(money)
			
func on_button_pressed():
	#create a random power for the ball
	spin_velocity = randf_range(-1000,-10000)
	spinning = true
	
