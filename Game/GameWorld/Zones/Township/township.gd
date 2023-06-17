extends "res://Game/GameWorld/Zones/zone.gd"

func _ready():
	electricity_usage = 10

func _on_game_game_timer():
	run_controllers()
