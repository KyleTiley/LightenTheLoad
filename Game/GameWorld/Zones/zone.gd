extends Node

# SIGNALS

signal use_total_electricity
signal zone_clicked

# VARIABLES

# Electricity variables
var is_using_electricity = true
var electricity_usage
var electricity_used = 0
# Happiness variables
var is_happy = true
var current_happiness = 50

# FUNCTIONS

# Runs all controllers
func run_controllers():
	electricity_controller()
	happiness_controller()

# Controlls electricity usage
func electricity_controller():
	if is_using_electricity:
		is_happy = true
		electricity_used += electricity_usage
	else:
		is_happy = false

# Controlls happiness usage
func happiness_controller():
	if is_happy:
		current_happiness += 1
	else:
		current_happiness -= 1
	# Keeps happiness between 0 and 100
	current_happiness = clamp(current_happiness, 0, 100)
	if current_happiness <= 0:
		Global.change_scene("Menu")

# Click function for zone
func _on_area_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		# If the event is left mouse click
		if event.pressed and event.button_index == 1:
			zone_clicked.emit(name, is_using_electricity, electricity_used, current_happiness)
