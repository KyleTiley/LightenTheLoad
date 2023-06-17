extends "res://Game/GameWorld/Zones/zone.gd"

func _ready():
	electricity_usage = 15

func _on_game_zone_timer():
	print("suburb emitted")
