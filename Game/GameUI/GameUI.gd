extends Control

func _ready():
	Zone.displayInfo.connect(_on_zones_display_info)

func _on_zones_display_info(_name, _electricityUsed, _currentHappiness):
	print(_name + " has used " + str(_electricityUsed) + " electricity")
	print(_currentHappiness)
