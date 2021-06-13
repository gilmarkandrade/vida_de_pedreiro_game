extends Node2D


func play(value):
	
	get_node(value).play()

func stop(value):
	get_node(value).stop()
