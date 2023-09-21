extends Node

# SIGNALS

signal game_timer
signal display_info
signal start_event

# REFERENCES
@onready var city_zone = $GameWorld/Zones/City
@onready var suburb_zone = $GameWorld/Zones/Suburb
@onready var stadium_zone = $GameWorld/Zones/Stadium
@onready var township_zone = $GameWorld/Zones/Township

# VARIABLES

var timer_counter = 0
var active_zone

# FUNCTIONS

func _ready():
	set_daily_variables(Global.day_of_the_week)

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

# Sets unique variables for each day
func set_daily_variables(_day):
	match _day:
		"Tutorial":
			Global.total_allocated_electricity = 1000000
			Global.numberOfEvents = 0
		"Monday":
			Global.total_allocated_electricity = 10000
			Global.numberOfEvents = 0
		"Tuesday":
			Global.total_allocated_electricity = 9000
			Global.numberOfEvents = 1
		"Wednesday":
			Global.total_allocated_electricity = 8000
			Global.numberOfEvents = 2
		"Thursday":
			Global.total_allocated_electricity = 7000
			Global.numberOfEvents = 3
		"Friday":
			Global.total_allocated_electricity = 5000
			Global.numberOfEvents = 4

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

# Calls to toggle the active zone's power on or off
func _on_info_bar_toggle_power():
	active_zone.toggle_zone_power()

# Marks the time for an event to be called
func _on_clock_event_time():
	start_event.emit()


