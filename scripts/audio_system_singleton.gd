extends Node2D


func _play(value):
	print(value)
	if get_node(value).playing == false:
		get_node(str(value)).play()
	
func _stop(value):
	get_node(str(value)).stop()
