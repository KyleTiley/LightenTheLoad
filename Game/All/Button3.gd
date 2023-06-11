extends Button

func _ready():
	var button = Button.new()
	button.text = "Play"
	button.pressed.connect(self._button_pressed)
	add_child(button)

func _button_pressed():
	Global.maintanance = true
