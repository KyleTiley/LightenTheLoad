extends Control

# SIGNALS
signal event_time
signal loadshedding_time
signal day_over

# REFERENCES
@onready var day_label = $Day
@onready var time_label = $Time
@onready var sun = $"../../DirectionalLight3D"

# SUN
var sun_start = -180
var sun_end = 0
var rot_val = 0.025

# VARIABLES
var time_elapsed_per_second = 5
var clock_minutes = 30
var clock_hours = 0
var start_time = 7
var end_time = 18
var event_time_reached
var schedule_time_reached

#Analog Clock
var township_color = Color.hex(0xBE4A2Fff)
var city_color = Color.hex(0x124E89ff)
var suburb_color = Color.hex(0x265C42ff)
var stadium_color = Color.hex(0xfee761ff)
var analog_start = -190
@onready var hand = $AnalogClock/Hand
var analog_rot = 0.0415

func _ready():
	day_label.text = Global.day_of_the_week
	clock_hours = start_time
	event_time_reached = false
	schedule_time_reached = false

func _process(_delta):
	tutorial_help()
	if clock_minutes == 60:
		clock_hours += 1
		clock_minutes = 0
		print(sun.rotation.x)
	if clock_hours == end_time:
		day_over.emit()
	change_clock_time()
	# Marks the points where events are called
	if clock_minutes == 0:
		if clock_hours == 9 or clock_hours == 11 or clock_hours == 13 or clock_hours == 15 or clock_hours == 17:
			if !event_time_reached:
				event_time.emit()
				event_time_reached = true
		# Resets event time
		elif event_time_reached == true:
			event_time_reached = false
	
	if clock_minutes == 0 or clock_minutes == 30:
		if !schedule_time_reached:
			loadshedding_time.emit(clock_hours, clock_minutes)
			schedule_time_reached = true
	else:
		# this code is never reached???
		schedule_time_reached = false

func _physics_process(delta):
	if Global.game_has_started == false:
		return
	sun.rotate_z(deg_to_rad(rot_val))
	hand.rotation += deg_to_rad(analog_rot)

# Controls the speed of the clock
func _on_game_game_timer():
	clock_minutes += time_elapsed_per_second

func change_clock_time():
	var _time : String = "%02d:%02d" % [clock_hours, clock_minutes]
	time_label.text = _time
	
	
func tutorial_help():
	if clock_hours < 8:
		Global.tut_prog = 0
	if clock_hours == 8:
		if 	Global.tut_prog == 0:
			Global.tut_prog = 1
	if  clock_hours == 9:
		Global.tut_prog = 4
	

