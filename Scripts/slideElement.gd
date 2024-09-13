class_name Slide
extends Node2D

var expectedX = position.x
var progress = 0
var newX
var go = false

func _ready() -> void:
	
	#This object must have a child.
	var child = get_children()[0]
	
	newX = 0 - child.size.x
	var newY = position.y
	position = Vector2(newX, newY)
	print(str(position))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	#Use an algerbraic equation for movement.
	#Going from 0, to 1. where x in f(x) is the position we want it to be at.
	
	if(go):
		#Setup for the equation.
		var c1 = 1.70158
		var c3 = c1 + 1
		
		#Move the Node2D
		if(progress < 1):
			var step = 1 + c3 * pow(progress - 1, 3) + c1 * pow(progress - 1, 2)
			position.x = newX + ((expectedX + (newX*-1)) * step) 
			progress += 0.01
	
	# Ease in and out expression
	# -(cos(progress*PI)-1)/2
	
	# Bounce back expression
	# c1 = 1.70158
	# c3 = c1 + 1
	# 1 + c3 * pow(progress - 1, 3) + c1 * pow(progress - 1, 2)
	
	# Funny Code!!
	#if(progress < 1):
	#	position.x += expectedX * progress
	#	progress += 0.01
	

func shouldGo(boolean):
	go = boolean
