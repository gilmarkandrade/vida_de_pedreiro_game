extends Node2D



func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		$final_anim.play("final")
		


func _on_final_anim_animation_finished(anim_name):
	if anim_name == "final":
		var sf = preload("res://scenes/final_scren.tscn").instance()
		add_child(sf)
