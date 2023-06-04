extends Control

@onready var textLabel = $Info/TextEdit


func _ready():
	Zone.displayInfo.connect(_on_zones_display_info)

func _on_zones_display_info(_name, _electricityUsed, _currentHappiness):
	textLabel.text = _name + " has used " + str(_electricityUsed) + " electricity" + '\n' + "and is at " + str(_currentHappiness) + " happiness"
