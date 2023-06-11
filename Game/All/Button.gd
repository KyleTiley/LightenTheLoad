extends Button
 
func _ready():
	var button = Button.new()
	button.text = "Play"
	button.pressed.connect(self._button_pressed)
	add_child(button)

func _button_pressed():
	if(Global.switch_counter == 5):
		Global.start_maintanance = true
		Global.disable_check_buttons = true
