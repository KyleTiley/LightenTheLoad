extends Control

# SIGNALS
signal toggle_power

# REFERENCES
@onready var game_info = $GameInfo
@onready var power_button = $PowerButton

# FUNCTIONS

func display_info(_name, _using_electricity, _electricity, _happiness):
	game_info.text = ""
	game_info.text += _name + " has used " + str(_electricity) + " units of electricity" + '\n'
	game_info.text += " and is at " + str(_happiness) + " happiness"
	power_button.visible = true
	if _using_electricity:
		power_button.text = "Power:" + '\n' + "ON"
	else:
		power_button.text = "Power:" + '\n' + "OFF"

func _on_power_button_pressed():
	update_power_button()

func update_power_button():
	power_button.text = "thing"

func _on_game_display_info(_selected_zone, _is_using_electricity, _electricity_used, _current_happiness):
	display_info(_selected_zone, _is_using_electricity, _electricity_used, _current_happiness)
