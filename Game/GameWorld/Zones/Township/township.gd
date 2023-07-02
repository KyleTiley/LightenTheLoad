extends "res://Game/GameWorld/Zones/zone.gd"

func _ready():
	electricity_usage = 10
	happiness_gain = 2
	happiness_loss = 2

func _on_game_game_timer():
	run_controllers()

func _on_clock_loadshedding_time(_loadshedding_time):
	if _loadshedding_time == Global.township_schedule1 or _loadshedding_time == Global.township_schedule2:
		print("loadshedding started at: " + name)
	if _loadshedding_time == Global.township_schedule1 or _loadshedding_time == Global.township_schedule2:
		print("loadshedding started at: " + name)
