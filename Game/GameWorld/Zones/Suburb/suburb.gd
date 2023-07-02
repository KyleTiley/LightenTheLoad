extends "res://Game/GameWorld/Zones/zone.gd"

func _ready():
	electricity_usage = 15
	happiness_gain = 5
	happiness_loss = 5

func _on_game_game_timer():
	run_controllers()


func _on_clock_loadshedding_time(_clock_hours, _clock_minutes):
	if _clock_minutes == 0:
		if _clock_hours == int(Global.suburb_schedule1) or _clock_hours == int(Global.suburb_schedule2):
			print("loadshedding started at: " + name)
			happiness_gain = 10
			happiness_loss = 5
	elif _clock_minutes == 30:
		if _clock_hours == (int(Global.suburb_schedule1) + 2) or _clock_hours == (int(Global.suburb_schedule2) + 2):
			print("loadshedding ended at: " + name)
			happiness_loss = 10
			happiness_gain = 5
