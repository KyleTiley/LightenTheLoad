extends "res://Game/GameWorld/Zones/zone.gd"

var base_happiness_gain : int = 6
var base_happiness_loss : int  = 6

func _ready():
	electricity_usage = 20
	happiness_gain = base_happiness_gain
	happiness_loss = base_happiness_loss

func _on_game_game_timer():
	run_controllers()

func _on_clock_loadshedding_time(_clock_hours, _clock_minutes):
	if _clock_minutes == 0:
		if _clock_hours == int(Global.city_schedule1) or _clock_hours == int(Global.city_schedule2):
			print("loadshedding started at: " + name)
			happiness_gain = base_happiness_gain * 2
			happiness_loss = base_happiness_loss / 2
	elif _clock_minutes == 30:
		if _clock_hours == (int(Global.city_schedule1) + 2) or _clock_hours == (int(Global.city_schedule2) + 2):
			print("loadshedding ended at: " + name)
			happiness_gain = base_happiness_gain
			happiness_loss = base_happiness_loss
