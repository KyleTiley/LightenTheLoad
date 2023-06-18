extends Node

# SIGNALS

signal game_timer

# REFERENCES

var zone = "res://Game/GameWorld/Zones/zone.gd"

# VARIABLES

var timer_counter = 0
var total_allocated_electricity
var selected_zone

# FUNCTIONS

func _ready():
	set_total_allocated_electricity(Global.day_of_the_week)
#	zone.zone_clicked.connect(temp_display)

# Increments timer
func _physics_process(delta):
	if Global.game_has_started:
		timer_counter += delta

# Delegates tasks every second
func _process(_delta):
	if timer_counter > 1:
		game_timer.emit()
		timer_counter = 0

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

func temp_display():
	print("FUCK")

func _on_city_zone_clicked():
	pass # Replace with function body.


func _on_stadium_zone_clicked():
	pass # Replace with function body.


func _on_township_zone_clicked():
	pass # Replace with function body.


func _on_suburb_zone_clicked():
	pass # Replace with function body.
