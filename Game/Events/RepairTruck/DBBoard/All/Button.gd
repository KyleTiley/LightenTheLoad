extends Button

var temp_bool = 0

func _process(delta):
	if Global.enable_minigame_start_button == true:
		if temp_bool == 0:
			var button = Button.new()
			button.text = "Start"
			button.pressed.connect(self._button_pressed)
			add_child(button)
			temp_bool = 1

func _button_pressed():
	temp_bool = 0
	Global.start_maintanance = true

