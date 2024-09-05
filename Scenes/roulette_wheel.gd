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
			
		if !spinning:
			var angle=self.rotation
			var ball = $"../Ball"
			var ball_angle=ball.rotation
			print(angle)
			print(ball_angle)
			angle = abs(angle+ball_angle)
			print(angle)
			var new_angle: int=angle
			print(new_angle%360)
			if new_angle%360>=346 && new_angle%360<=354:
				print("2, BLACK, EVEN, 1-18, 1st 12, 2nd 2 to 1")
			elif new_angle%360>=335 && new_angle%360<=345:
				print("14, RED, EVEN, 1-18, 2nd 12, 2nd 2 to 1")
			elif new_angle%360>=326 && new_angle%360<=334:
				print("35, BLACK, ODD, 19-36, 3rd 12, 2nd 2 to 1")
			elif new_angle%360>=317 && new_angle%360<=325:
				print("23, RED, ODD, 19-36, 2nd 12, 2nd 2 to 1")
			elif new_angle%360>=306 && new_angle%360<=316:
				print("4, BLACK, EVEN, 1-18, 1st 12, 1st 2 to 1")
			elif new_angle%360>=296 && new_angle%360<=305:
				print("16, RED, EVEN, 1-18, 2nd 12, 1st 2 to 1")
			elif new_angle%360>=286 && new_angle%360<=295:
				print("33, BLACK, ODD, 19-36, 3rd 12, 3rd 2 to 1")
			elif new_angle%360>=279 && new_angle%360<=285:
				print("21, RED, ODD, 19-36, 2nd 12, 3rd 2 to 1")
			elif new_angle%360>=270 && new_angle%360<=278:
				print("6, BLACK, EVEN, 1-18, 1st 12, 3rd 2 to 1")
			elif new_angle%360>=262 && new_angle%360<=269:
				print("18, RED, EVEN, 1-18, 2nd 12, 3rd 2 to 1")
			elif new_angle%360>=254 && new_angle%360<=261:
				print("31, BLACK, ODD, 19-36, 3rd 12, 1st 2 to 1")
			elif new_angle%360>=245 && new_angle%360<=253:
				print("19, RED, ODD, 19-36, 2nd 12, 1st 2 to 1")
			elif new_angle%360>=234 && new_angle%360<=244:
				print("8, BLACK, EVEN, 1-18, 1st 12, 2nd 2 to 1")
			elif new_angle%360>=223 && new_angle%360<=233:
				print("12, RED, EVEN, 1-18, 1st 12, 3rd 2 to 1")
			elif new_angle%360>=213 && new_angle%360<=222:
				print("29, BLACK, ODD, 19-36, 3rd 12, 2nd 2 to 1")
			elif new_angle%360>=202 && new_angle%360<=212:
				print("25, RED, ODD, 19-36, 3rd 12, 1st 2 to 1")
			elif new_angle%360>=193 && new_angle%360<=201:
				print("10, BLACK, EVEN, 1-18, 1st 12, 1st 2 to 1")
			elif new_angle%360>=184 && new_angle%360<=192:
				print("27, RED, ODD, 19-36, 3rd 12, 3rd 2 to 1")
			elif new_angle%360>=173 && new_angle%360<=183:
				print("00, Green")
			elif new_angle%360>=165 && new_angle%360<=172:
				print("1, RED, ODD, 1-18, 1st 12, 1st 2 to 1")
			elif new_angle%360>=155 && new_angle%360<=165:
				print("13, BLACK, ODD, 1-18, 2nd 12, 1st 2 to 1")
			elif new_angle%360>=148 && new_angle%360<=154:
				print("36, RED, EVEN, 19-36, 3rd 12, 3rd 2 to 1")
			elif new_angle%360>=140 && new_angle%360<=147:
				print("24, BLACK, EVEN, 19-36, 2nd 12, 3rd 2 to 1")
			elif new_angle%360>=129 && new_angle%360<=139:
				print("3, RED, ODD, 1-18, 1st 12, 3rd 2 to 1")
			elif new_angle%360>=118 && new_angle%360<=128:
				print("15, BLACK, ODD, 1-18, 2nd 12, 3rd 2 to 1")
			elif new_angle%360>=105 && new_angle%360<=117:
				print("34, RED, EVEN, 19-36, 3rd 12, 1st 2 to 1")
			elif new_angle%360>=97 && new_angle%360<=104:
				print("22, BLACK, EVEN, 19-36, 2nd 12, 1st 2 to 1")
			elif new_angle%360>=91 && new_angle%360<=96:
				print("5, RED, ODD, 1-18, 1st 12, 2nd 2 to 1")
			elif new_angle%360>=83 && new_angle%360<=90:
				print("17, BLACK, ODD, 1-18, 2nd 12, 2nd 2 to 1")
			elif new_angle%360>=75 && new_angle%360<=82:
				print("32, RED, EVEN, 19-36, 3rd 12, 2nd 2 to 1")
			elif new_angle%360>=66 && new_angle%360<=74:
				print("20, BLACK, EVEN, 19-36, 2nd 12, 2nd 2 to 1")
			elif new_angle%360>=55 && new_angle%360<=65:
				print("7, RED, ODD, 1-18, 1st 12, 1st 2 to 1")
			elif new_angle%360>=45 && new_angle%360<=54:
				print("11, BLACK, ODD, 1-18, 1st 12, 2nd 2 to 1")
			elif new_angle%360>=33 && new_angle%360<=44:
				print("30, RED, EVEN, 19-36, 3rd 12, 3rd 2 to 1")
			elif new_angle%360>=22 && new_angle%360<=32:
				print("26, BLACK, EVEN, 19-36, 3rd 12, 2nd 2 to 1")
			elif new_angle%360>=13 && new_angle%360<=21:
				print("9, RED, ODD, 1-18, 1st 12, 3rd 2 to 1")
			elif new_angle%360>=5 && new_angle%360<=12:
				print("28, BLACK, EVEN, 19-36, 3rd 12, 1st 2 to 1")
			else: 
				print("0, Green")
						
func on_button_pressed():
	#create a random power for the wheel
	spin_velocity = randf_range(10000,90000)
	spinning = true
	
