extends Control

@onready var textLabel = $Info/TextEdit

func _on_game_display_info(_name, _electricity, _happiness):
	textLabel.text = _name + " has used " + str(_electricity) + " electricity" + '\n' + "and is at " + str(_happiness) + " happiness"
