extends Node3D

# SIGNALS
signal city_truck
signal suburb_truck
signal stadium_truck
signal township_truck

signal big_game_event

signal city_storm
signal suburb_storm
signal stadium_storm
signal township_storm

# VARIABLES
var started_daily_event

func _ready():
	started_daily_event = false

# Contols the random events
func _on_game_start_event():
	var newRandomNumber = RandomNumberGenerator.new()
	newRandomNumber.randomize()
	var eventNumber = newRandomNumber.randi_range(1, Global.numberOfEvents)
	
	# Makes sure that the first event for a day is the daily event
	if !started_daily_event and Global.day_of_the_week != "Friday":
		eventNumber = Global.numberOfEvents
		started_daily_event = true
	
	# Stops events on the first day
	if Global.day_of_the_week == "Monday" or Global.day_of_the_week == "Tutorial":
		eventNumber = 0
	
	# Fixes the friday event's time
	if Global.day_of_the_week == "Friday":
		pass # fix this
	
	match eventNumber:
		0:
			print("no events today")
		1:
			print("repair truck event started")
			var repair_random = newRandomNumber.randi_range(1, 4)
			match repair_random:
				1:
					city_truck.emit()
				2:
					suburb_truck.emit()
				3:
					stadium_truck.emit()
				4:
					township_truck.emit()
		2:
			print("storm event started")
			var storm_random = newRandomNumber.randi_range(1, 4)
			match storm_random:
				1:
					city_storm.emit()
				2:
					suburb_storm.emit()
				3:
					stadium_storm.emit()
				4:
					township_storm.emit()
		3:
			print("budget cuts event")
			Global.total_allocated_electricity -= 500
		4:
			print("game day event started")
			big_game_event.emit()

func _on_tutorial_spotlight_truck_tut():
	city_truck.emit()

func _on_tutorial_spotlight_storm_tut():
	township_storm.emit()
