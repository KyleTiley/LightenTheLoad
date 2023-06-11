extends Control

@onready var textLabel = $Info/TextEdit
@onready var powerButton = $PowerButton/Button

# SIGNALS

signal TogglePower

# FUNCTIONS

func _on_game_display_info(_name, _electricity, _happiness, _isUsingElectricity):
	textLabel.text = _name + " has used " + str(_electricity) + " units of electricity" + '\n' + "and is at " + str(_happiness) + " happiness"
	if(_isUsingElectricity):
		powerButton.text = "Power:" + '\n' + "ON"
	else:
		powerButton.text = "Power:" + '\n' + "OFF"

func _on_button_pressed():
	TogglePower.emit()
