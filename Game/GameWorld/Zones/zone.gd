extends Node

# SIGNALS

signal use_total_electricity
signal zone_clicked

# REFERENCES


# VARIABLES
var active_zone

# Electricity variables
var is_using_electricity = true
var electricity_used = 0
var electricity_usage
# Happiness variables
var is_happy = true
var current_happiness = 50
var happiness_loss
var happiness_gain

# FUNCTIONS

func _process(_delta):
	# Emits the zone clicked signal for the most recently selected zone
	if active_zone != null:
		print(active_zone)
		active_zone.zone_clicked.emit(name, is_using_electricity, electricity_used, current_happiness)

# Runs all controllers
func run_controllers():
	electricity_controller()
	happiness_controller()

# Controlls electricity usage
func electricity_controller():
	if is_using_electricity:
		is_happy = true
		electricity_used += electricity_usage
		Global.total_allocated_electricity -= electricity_usage
	else:
		is_happy = false
		
	if Global.total_allocated_electricity <= 0:
		print("GAME OVER")
		Global.change_scene("MainMenu")

# Controlls happiness usage
func happiness_controller():
	if is_happy:
		current_happiness += happiness_gain
	else:
		current_happiness -= happiness_loss
	# Keeps happiness between 0 and 100
	current_happiness = clamp(current_happiness, 0, 100)
	if current_happiness == 0:
		print("GAME OVER")
		Global.change_scene("MainMenu")

# Click function for zone
func _on_area_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		# If the event is left mouse click
		if event.pressed and event.button_index == 1:
			get_zone_info()

# Gets the zone's information
func get_zone_info():
	zone_clicked.emit(name, is_using_electricity, electricity_used, current_happiness)

# Toggles the power of a zone on and off
func toggle_zone_power():
	is_using_electricity = !is_using_electricity
