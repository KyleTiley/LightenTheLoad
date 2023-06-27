extends "res://Game/GameWorld/Zones/zone.gd"

func _ready():
	electricity_usage = 10
	happiness_gain = 2
	happiness_loss = 2

func _on_game_game_timer():
	run_controllers()
