extends Control

var pressed = false

func _ready():
	$bt_jogar.grab_focus()
	
func _on_bt_jogar_pressed():
	
	if pressed == false:
		pressed = true
		yield(get_tree().create_timer(1),"timeout")
		get_tree().change_scene("res://levels/1.tscn")
		

func _on_bt_creditos_pressed():
	if pressed == false:
		$panel_credit.visible = true
		$panel_credit/bt_voltar.grab_focus()

func _on_bt_sair_pressed():
	if pressed == false:
		get_tree().quit()


func _on_bt_voltar_pressed():
	$bt_creditos.grab_focus()
	$panel_credit.visible = false
