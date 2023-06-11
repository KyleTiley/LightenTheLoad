extends CheckButton

func _process(delta):
	if Global.disable_check_buttons == true:
		self.disabled = true
	if Global.disable_check_buttons == false:
		self.disabled = false
	if Global.switch_counter == 5:
		Global.enable_minigame_retun_button = true

func _toggled(button_pressed):
	blah()

func blah():
	if(self.button_pressed == true):
		Global.switch_counter += 1
	if(self.button_pressed == false):
		Global.switch_counter -= 1
	print(Global.switch_counter)
