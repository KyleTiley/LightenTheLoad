extends Node

#Variables
var totalElectricity
var currentElectricity
var electrityUsage
var totalHappiness
var currentHappiness

#Click methods
func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == 1:
			print("CLICKED")
