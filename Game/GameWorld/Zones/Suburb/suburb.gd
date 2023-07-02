extends "res://Game/GameWorld/Zones/zone.gd"

func _ready():
	electricity_usage = 15
	happiness_gain = 5
	happiness_loss = 5

func _on_game_game_timer():
	run_controllers()


func _on_clock_loadshedding_time():
	pass # Replace with function body.
