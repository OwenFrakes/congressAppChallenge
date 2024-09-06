extends Sprite2D
#determin if the wheel is spinning
var spinning = false
#set how fast the wheel spins 
var spin_velocity = 0
#make the wheel slow down
var friction = 0.8


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#make wheel centered
	self.centered = true
	#create var for button
	var button_node = $"../Button"
	button_node.connect("pressed", Callable(self, "on_button_pressed"))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#when wheel is spinning
	var current_angle = self.rotation
	if spinning:
		if spin_velocity!=0:
			#create var angle
			
			#change the angle
			current_angle += spin_velocity * delta
			#slow the wheel
			spin_velocity *= friction
			#make the wheel stop when the velocity is too low
			if abs(spin_velocity) < 0.1:
				spin_velocity = 0
				spinning = false
			#set rotation to new current angle
			self.rotation = current_angle
			
		#if !spinning:
			#var angle=self.global_rotation_degrees
			#var ball_angle= $"../Ball".global_rotation_degrees
			#print(angle)
			#print(ball_angle)
			#angle = angle+ball_angle
			#print(angle)
			#var new_angle: int=angle
			#print(new_angle%180)
			#if new_angle%180>=5 && new_angle%180<=12:
				#print("2, BLACK, EVEN, 1-18, 1st 12, 2nd 2 to 1")
			#elif new_angle%180>=13 && new_angle%180<=21:
				#print("14, RED, EVEN, 1-18, 2nd 12, 2nd 2 to 1")
			#elif new_angle%180>=22 && new_angle%180<=32:
				#print("35, BLACK, ODD, 19-36, 3rd 12, 2nd 2 to 1")
			#elif new_angle%180>=33 && new_angle%180<=44:
				#print("23, RED, ODD, 19-36, 2nd 12, 2nd 2 to 1")
			#elif new_angle%180>=45 && new_angle%180<=54:
				#print("4, BLACK, EVEN, 1-18, 1st 12, 1st 2 to 1")
			#elif new_angle%180>=55 && new_angle%180<=65:
				#print("16, RED, EVEN, 1-18, 2nd 12, 1st 2 to 1")
			#elif new_angle%180>=66 && new_angle%180<=74:
				#print("33, BLACK, ODD, 19-36, 3rd 12, 3rd 2 to 1")
			#elif new_angle%180>=75 && new_angle%180<=82:
				#print("21, RED, ODD, 19-36, 2nd 12, 3rd 2 to 1")
			#elif new_angle%180>=83 && new_angle%180<=90:
				#print("6, BLACK, EVEN, 1-18, 1st 12, 3rd 2 to 1")
			#elif new_angle%180>=91 && new_angle%180<=96:
				#print("18, RED, EVEN, 1-18, 2nd 12, 3rd 2 to 1")
			#elif new_angle%180>=97 && new_angle%180<=104:
				#print("31, BLACK, ODD, 19-36, 3rd 12, 1st 2 to 1")
			#elif new_angle%180>=105 && new_angle%180<=117:
				#print("19, RED, ODD, 19-36, 2nd 12, 1st 2 to 1")
			#elif new_angle%180>=118 && new_angle%180<=128:
				#print("8, BLACK, EVEN, 1-18, 1st 12, 2nd 2 to 1")
			#elif new_angle%180>=129 && new_angle%180<=139:
				#print("12, RED, EVEN, 1-18, 1st 12, 3rd 2 to 1")
			#elif new_angle%180>=140 && new_angle%180<=147:
				#print("29, BLACK, ODD, 19-36, 3rd 12, 2nd 2 to 1")
			#elif new_angle%180>=148 && new_angle%180<=154:
				#print("25, RED, ODD, 19-36, 3rd 12, 1st 2 to 1")
			#elif new_angle%180>=155 && new_angle%180<=164:
				#print("10, BLACK, EVEN, 1-18, 1st 12, 1st 2 to 1")
			#elif new_angle%180>=165 && new_angle%180<=172:
				#print("27, RED, ODD, 19-36, 3rd 12, 3rd 2 to 1")
			#elif new_angle%180>=-4 && new_angle%180<=4:
				#print("0, Green")
			#elif new_angle%180>=-175 && new_angle%180<=-167:
				#print("1, RED, ODD, 1-18, 1st 12, 1st 2 to 1")
			#elif new_angle%180>=-166 && new_angle%180<=-158:
				#print("13, BLACK, ODD, 1-18, 2nd 12, 1st 2 to 1")
			#elif new_angle%180>=-157 && new_angle%180<=-147:
				#print("36, RED, EVEN, 19-36, 3rd 12, 3rd 2 to 1")
			#elif new_angle%180>=-146 && new_angle%180<=-138:
				#print("24, BLACK, EVEN, 19-36, 2nd 12, 3rd 2 to 1")
			#elif new_angle%180>=-137 && new_angle%180<=-126:
				#print("3, RED, ODD, 1-18, 1st 12, 3rd 2 to 1")
			#elif new_angle%180>=-125 && new_angle%180<=-115:
				#print("15, BLACK, ODD, 1-18, 2nd 12, 3rd 2 to 1")
			#elif new_angle%180>=-114 && new_angle%180<=-106:
				#print("34, RED, EVEN, 19-36, 3rd 12, 1st 2 to 1")
			#elif new_angle%180>=-105 && new_angle%180<=-98:
				#print("22, BLACK, EVEN, 19-36, 2nd 12, 1st 2 to 1")
			#elif new_angle%180>=-97 && new_angle%180<=-89:
				#print("5, RED, ODD, 1-18, 1st 12, 2nd 2 to 1")
			#elif new_angle%180>=-88 && new_angle%180<=-81:
				#print("17, BLACK, ODD, 1-18, 2nd 12, 2nd 2 to 1")
			#elif new_angle%180>=-80 && new_angle%180<=-73:
				#print("32, RED, EVEN, 19-36, 3rd 12, 2nd 2 to 1")
			#elif new_angle%180>=-72 && new_angle%180<=-65:
				#print("20, BLACK, EVEN, 19-36, 2nd 12, 2nd 2 to 1")
			#elif new_angle%180>=-64 && new_angle%180<=-54:
				#print("7, RED, ODD, 1-18, 1st 12, 1st 2 to 1")
			#elif new_angle%180>=-53 && new_angle%180<=-43:
				#print("11, BLACK, ODD, 1-18, 1st 12, 2nd 2 to 1")
			#elif new_angle%180>=-42 && new_angle%180<=-33:
				#print("30, RED, EVEN, 19-36, 3rd 12, 3rd 2 to 1")
			#elif new_angle%180>=-32 && new_angle%180<=-26:
				#print("26, BLACK, EVEN, 19-36, 3rd 12, 2nd 2 to 1")
			#elif new_angle%180>=-25 && new_angle%180<=-15:
				#print("9, RED, ODD, 1-18, 1st 12, 3rd 2 to 1")
			#elif new_angle%180>=-14 && new_angle%180<=-5:
				#print("28, BLACK, EVEN, 19-36, 3rd 12, 1st 2 to 1")
			#else: 
				#print("00, Green")
						
func on_button_pressed():
	#create a random power for the wheel
	spin_velocity = randf_range(10000,90000)
	spinning = true
	
