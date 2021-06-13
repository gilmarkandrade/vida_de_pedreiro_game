extends Control


func _ready():
	$CanvasLayer/bt_restart.grab_focus()


func _on_bt_quit_pressed():
	get_tree().quit()


func _on_bt_restart_pressed():
	get_tree().change_scene("res://levels/"+str(SingletoGame.scene_current)+".tscn")
