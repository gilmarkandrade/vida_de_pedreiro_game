extends KinematicBody2D
var move = Vector2()
var up = Vector2(0,-1)
var speed = 20
var max_speed = 300
var gravity = 30
var jump_force = -400
var stop = false
var death = false
var liberate_reclama = false

func _physics_process(delta):
	
	move.y += gravity
	
		
	if stop == false:
		if Input.is_action_just_pressed("ui_up"):
			if is_on_floor():
				move.y = jump_force
				$anim_player.play("jump")
				
		if Input.is_action_pressed("ui_left"):
			if move.x > -max_speed :
				move.x -= speed 
				
			else:
				move.x =- (max_speed+10)
			if is_on_floor():
				$anim_player.play("walk")
		elif Input.is_action_pressed("ui_right"):
			if max_speed > move.x:
				move.x += speed 
				
			else:
				move.x = + (max_speed+10)
				
			if is_on_floor():
				$anim_player.play("walk")
		else:
			move.x = 0
			
		
				
		if Input.is_action_pressed("up_corda"):
		
			$Path2D/PathFollow2D.offset -= 3
			$anim_player.play("move_corda")
			
		if Input.is_action_pressed("dow_corda"):
			
			$anim_player.play("move_corda")
			$Path2D/PathFollow2D.offset += 4
			
	else:
		move.x = 0
		
	move = move_and_slide(move,up)
	

#=================================== personagem 2 ====================================

func _on_area_dano_area_entered(area):
	if area.is_in_group("damage") and death == false:
		death = true
		_death()



func _on_area_externa_area_entered(area):
	if area.is_in_group("damage") and liberate_reclama == false:
		$Path2D/PathFollow2D/character_2/anim_char_2.current_animation = "esperniando"
		$Path2D/PathFollow2D/character_2/reclamando.play()
		liberate_reclama = true
func _on_anim_char_2_animation_finished(anim_name):
	if anim_name == "esperniando":
		$Path2D/PathFollow2D/character_2/anim_char_2.current_animation = "idle"
		liberate_reclama = false
		
func _death():
	stop = true
	$Path2D/PathFollow2D/character_2/dano.play()
	$Path2D/PathFollow2D/character_2/anim_char_2.current_animation = "morte"
	yield(get_tree().create_timer(2),"timeout")
	var SC = preload("res://scenes/screen_restart.tscn").instance()
	add_child(SC)


