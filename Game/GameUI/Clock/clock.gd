extends Control

# SIGNALS
signal event_time
signal loadshedding_time
signal day_over

# REFERENCES
@onready var day_label = $Day
@onready var time_label = $Time

# VARIABLES
var time_elapsed_per_second = 30
var clock_minutes = 30
var clock_hours = 0
var start_time = 7
var end_time = 18
var event_time_reached
var schedule_time_reached

func _ready():
	day_label.text = Global.day_of_the_week
	clock_hours = start_time
	event_time_reached = false
	schedule_time_reached = false

func _process(_delta):
	if clock_minutes == 60:
		clock_hours += 1
		clock_minutes = 0
	if clock_hours == end_time:
		day_over.emit()
	change_clock_time()
	# Marks the points where events are called
	if clock_minutes == 0:
		if clock_hours == 9 or clock_hours == 11 or clock_hours == 13 or clock_hours == 15:
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

# Controls the speed of the clock
func _on_game_game_timer():
	clock_minutes += time_elapsed_per_second

func change_clock_time():
	var _time : String = "%02d:%02d" % [clock_hours, clock_minutes]
	time_label.text = _time
