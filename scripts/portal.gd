extends Node2D

export (int) var Next_scene = 0



func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://levels/"+str(Next_scene)+".tscn")
