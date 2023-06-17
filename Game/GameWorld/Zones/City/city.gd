extends "res://Game/GameWorld/Zones/zone.gd"

func _ready():
	electricity_usage = 20

func _on_game_game_timer():
	run_controllers()
