extends Button
 
var temp_bool = 0

func _process(delta):
	if Global.enable_minigame_retun_button == true:
		if temp_bool == 0:
			var button = Button.new()
			button.text = "Return"
			button.pressed.connect(self._button_pressed)
			add_child(button)
			temp_bool = 1

func _button_pressed():
	#if Global.switch_counter == 9:
	temp_bool = 0
	Global.return_vehicle = true
	#self.disabled = true
