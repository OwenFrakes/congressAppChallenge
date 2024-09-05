extends Sprite2D
#determin if the ball is spinning
var spinning = false
#set how fast the ball spins 
var spin_velocity = 0
#make the ball slow down
var friction = 0.9

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
func on_button_pressed():
	#create a random power for the ball
	spin_velocity = randf_range(-1000,-10000)
	spinning = true
