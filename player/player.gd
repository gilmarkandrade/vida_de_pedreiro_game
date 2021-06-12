extends KinematicBody2D
var move = Vector2()
var up = Vector2(0,-1)
var speed = 20
var max_speed = 300
var gravity = 30
var jump_force = -400
var stop = false


func _physics_process(delta):
	
	move.y += gravity
	
		
	if stop == false:
		
		if Input.is_action_pressed("ui_left"):
			if move.x > -max_speed :
				move.x -= speed 
				
			else:
				move.x =- (max_speed+10)
				
		elif Input.is_action_pressed("ui_right"):
			if max_speed > move.x:
				move.x += speed 
				
			else:
				move.x = + (max_speed+10)
		
		else:
			move.x = 0
			
		if Input.is_action_just_pressed("ui_up"):
			if is_on_floor():
				move.y = jump_force
		if Input.is_action_pressed("up_corda"):
		
			$Path2D/PathFollow2D.offset -= 3
			
			
		if Input.is_action_pressed("dow_corda"):
			
			
			$Path2D/PathFollow2D.offset += 4
			
			
		
		move = move_and_slide(move,up)
	
