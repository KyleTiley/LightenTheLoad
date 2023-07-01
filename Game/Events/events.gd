extends Node3D

# SIGNALS
signal repair_truck_event

# VARIABLES
var started_daily_event

func _ready():
	started_daily_event = false

# Contols the random events
func _on_game_start_event():
	var newRandomNumber = RandomNumberGenerator.new()
	newRandomNumber.randomize()
	var eventNumber = newRandomNumber.randi_range(0, Global.numberOfEvents)
	
	# Makes sure that the first event for a day is the daily event
	if(!started_daily_event):
		eventNumber = Global.numberOfEvents
		started_daily_event = true
	
	match eventNumber:
		0:
			print("no events today")
		1:
			print("repair truck event started")
			repair_truck_event.emit()
		2:
			print("storm event started")
		3:
			print("traffic jam event started")
		4:
			print("game day event started")
	
