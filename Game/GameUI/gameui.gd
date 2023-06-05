extends Control

@onready var textLabel = $Info/TextEdit

# SIGNALS
signal TogglePower

func _on_game_display_info(_name, _electricity, _happiness):
	textLabel.text = _name + " has used " + str(_electricity) + " units of electricity" + '\n' + "and is at " + str(_happiness) + " happiness"

func _on_button_pressed():
	TogglePower.emit()
