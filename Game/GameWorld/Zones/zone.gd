extends Node

# SIGNALS

signal use_total_electricity

# VARIABLES

# Electricity variables
var is_using_electricity
var electricity_usage
var electricity_used
# Happiness variables
var is_happy
var current_happiness
var total_happiness

# FUNCTIONS

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
		pass #???

# Click function for zone
func _on_area_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		# If the event is left mouse click
		if event.pressed and event.button_index == 1:
			print(name)
