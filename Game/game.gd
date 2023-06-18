extends Node

# SIGNALS

signal game_timer
signal display_info

# REFERENCES
@onready var city_zone = $GameWorld/Zones/City
@onready var suburb_zone = $GameWorld/Zones/Suburb
@onready var stadium_zone = $GameWorld/Zones/Stadium
@onready var township_zone = $GameWorld/Zones/Township

# VARIABLES

var timer_counter = 0
var total_allocated_electricity
var active_zone
var active_zone_name
var active_zone_is_using_electricity
var active_zone_electricity_used
var active_zone_current_happiness

# FUNCTIONS

func _ready():
	set_total_allocated_electricity(Global.day_of_the_week)

# Increments timer
func _physics_process(delta):
	if Global.game_has_started:
		timer_counter += delta

# Delegates tasks every second
func _process(_delta):
	if timer_counter > 1:
		game_timer.emit()
		timer_counter = 0
	if active_zone != null:
		# Tells the active zone to display its information
		active_zone.get_zone_info()

# Sets how much electricity can be used throughout each day
# ??? might use this later to set a whole bunch of stuff as a generic function 
func set_total_allocated_electricity(_day):
	match _day:
		"Monday":
			total_allocated_electricity = 10000
		"Tuesday":
			total_allocated_electricity = 12000
		"Wednesday":
			total_allocated_electricity = 14000
		"Thursday":
			total_allocated_electricity = 16000
		"Friday":
			total_allocated_electricity = 18000

# Delegates info regarding the currently selected zone
func selected_zone_manager(_name, _is_using_electricity, _electricity_used, _current_happiness):
	var selected_zone = _name
	var is_using_electricity = _is_using_electricity
	var electricity_used = _electricity_used
	var current_happiness = _current_happiness
	display_info.emit(selected_zone, is_using_electricity, electricity_used, current_happiness)

# Individual zone click functions to store variables
func _on_city_zone_clicked(_name, _is_using_electricity, _electricity_used, _current_happiness):
	active_zone = city_zone
	selected_zone_manager(_name, _is_using_electricity, _electricity_used, _current_happiness)

func _on_stadium_zone_clicked(_name, _is_using_electricity, _electricity_used, _current_happiness):
	active_zone = stadium_zone
	selected_zone_manager(_name, _is_using_electricity, _electricity_used, _current_happiness)

func _on_township_zone_clicked(_name, _is_using_electricity, _electricity_used, _current_happiness):
	active_zone = township_zone
	selected_zone_manager(_name, _is_using_electricity, _electricity_used, _current_happiness)

func _on_suburb_zone_clicked(_name, _is_using_electricity, _electricity_used, _current_happiness):
	active_zone = suburb_zone
	selected_zone_manager(_name, _is_using_electricity, _electricity_used, _current_happiness)
