extends Node2D

func _process(delta):
	reset_mg()

func reset_mg():
	if Global.reset_mini_game == true:
		var cb_1 = %CheckButton1
		var cb_2 = %CheckButton2
		var cb_3 = %CheckButton3
		var cb_4 = %CheckButton4
		var cb_5 = %CheckButton5
		
		cb_1.button_pressed = false
		cb_2.button_pressed = false
		cb_3.button_pressed = false
		cb_4.button_pressed = false
		cb_5.button_pressed = false
		
		Global.reset_mini_game = false
