extends Node

# SIGNALS

signal zone_timer

# VARIABLES

var game_timer = 0
var total_allocated_electricity
var selected_zone

# FUNCTIONS

func _ready():
	set_total_allocated_electricity(Global.day_of_the_week)
	print(total_allocated_electricity)

# Increments timer
func _physics_process(delta):
	if Global.game_has_started:
		game_timer += delta

# Delegates tasks every second
func _process(_delta):
	if game_timer > 1:
		zone_timer.emit()
		game_timer = 0

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
