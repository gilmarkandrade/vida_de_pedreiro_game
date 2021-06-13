extends Node2D


func _ready():
	
	SingletoGame.scene_current = get_node(".").name
	if $".".name == "1":
		yield(get_tree().create_timer(2),"timeout")
		AudioSystemMaster._play("track_gameplay")
