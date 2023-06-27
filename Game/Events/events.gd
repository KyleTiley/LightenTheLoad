extends Node3D

signal repair_truck_event

func _on_game_start_event():
	# Just one event for now
	repair_truck_event.emit()
