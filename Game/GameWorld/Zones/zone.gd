extends Node

# VARIABLES
var electricity_usage

# FUNCTIONS

# Click function for zone
func _on_area_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		# If the event is left mouse click
		if event.pressed and event.button_index == 1:
			print(name)
