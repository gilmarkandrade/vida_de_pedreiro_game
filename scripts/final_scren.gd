extends Control

func _ready():
	$CanvasLayer/Normal/bt_menu.grab_focus()
	AudioSystemMaster._stop("track_gameplay")
	$CanvasLayer/Normal/victory.play()
	

func _on_bt_menu_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")


func _on_bt_quit_pressed():
	get_tree().quit()
