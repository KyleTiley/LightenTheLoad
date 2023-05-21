extends Control

func _ready():
	Zone.displayInfo.connect(_on_zones_display_info)

func _on_zones_display_info():
	print("DONE")
