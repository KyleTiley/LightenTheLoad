extends Node

# SIGNALS

signal use_total_electricity
signal zone_clicked

# REFERENCES
@onready var city_zone = "res://Game/GameWorld/Zones/City/city.gd"
@onready var suburb_zone = "res://Game/GameWorld/Zones/Suburb/suburb.gd"
@onready var stadium_zone = "res://Game/GameWorld/Zones/Stadium/stadium.gd"
@onready var township_zone = "res://Game/GameWorld/Zones/Township/township.gd"

# VARIABLES
var active_zone

# Electricity variables
var is_using_electricity = true
var electricity_usage
var electricity_used = 0
# Happiness variables
var is_happy = true
var current_happiness = 50

# FUNCTIONS

func _process(_delta):
	# Emits the zone clicked signal for the most recently selected zone
	if active_zone != null:
		print(active_zone)
#		active_zone.zone_clicked.emit(name, is_using_electricity, electricity_used, current_happiness)

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
			match name:
				"City":
					active_zone = city_zone
				"Suburb":
					active_zone = suburb_zone
				"Stadium":
					active_zone = stadium_zone
				"Township":
					active_zone = township_zone
