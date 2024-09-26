extends Sprite2D
#determin if the wheel is spinning
var spinning = false
#set how fast the wheel spins 
var spin_velocity = 0
#make the wheel slow down
var friction = 0.8
#betting variables
var inside_bet = 0
var six_line = 0
var corner_bet=0
var street_bet=0
var split_bet=0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#make wheel centered
	self.centered = true
	#create var for button
	var button_node = $"../Button"
	button_node.connect("pressed", Callable(self, "on_button_pressed"))
	var table=$"../Table"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#create var angle
	var current_angle = self.rotation
	#when wheel is spinning
	if spinning:
		if spin_velocity!=0:
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
						
func on_button_pressed():
	#create a random power for the wheel
	spin_velocity = randf_range(10000,90000)
	spinning = true

#six line bet
func _on_six_line_bet_on_six_numbers_item_selected(index: int) -> void:
	six_line=index
	inside_bet=$"../Table".betMenu.getPlayerBet()
	$"../Table/Split bet".selected=0
	$"../Table/Street bet".selected=0
	$"../Table/Corner bet".selected=0

#corner bet
func _on_corner_bet_item_selected(index: int) -> void:
	corner_bet=index
	inside_bet=$"../Table".betMenu.getPlayerBet()
	$"../Table/Split bet".selected=0
	$"../Table/Street bet".selected=0
	$"../Table/Six line bet on six numbers".selected=0

#street bet
func _on_street_bet_item_selected(index: int) -> void:
	street_bet=index
	inside_bet=$"../Table".betMenu.getPlayerBet()
	$"../Table/Split bet".selected=0
	$"../Table/Corner bet".selected=0
	$"../Table/Six line bet on six numbers".selected=0


func _on_split_bet_item_selected(index: int) -> void:
	split_bet=index
	inside_bet=$"../Table".betMenu.getPlayerBet()
	$"../Table/Street bet".selected=0
	$"../Table/Corner bet".selected=0
	$"../Table/Six line bet on six numbers".selected=0
