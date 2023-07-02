extends "res://Game/GameWorld/Zones/zone.gd"

func _ready():
	electricity_usage = 20
	happiness_gain = 3
	happiness_loss = 3

func _on_game_game_timer():
	run_controllers()


func _on_clock_loadshedding_time():
	pass # Replace with function body.
