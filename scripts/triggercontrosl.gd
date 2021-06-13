extends Area2D



func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		$"../animtriggercontrol".play("New Anim")


func _on_Area2D_body_exited(body):
	$"../animtriggercontrol".play_backwards("New Anim")
