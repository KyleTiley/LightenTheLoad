extends "res://Game/GameWorld/Zones/zone.gd"

func _ready():
	electricity_usage = 5
	happiness_gain = 10
	happiness_loss = 10

func _on_game_game_timer():
	run_controllers()

func _on_big_game_start_big_game():
	electricity_usage = 50
	happiness_loss = 20


func _on_clock_loadshedding_time():
	pass # Replace with function body.
