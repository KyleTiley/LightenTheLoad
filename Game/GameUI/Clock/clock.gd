extends Control

# REFERENCES
@onready var day_label = $Day
@onready var time_label = $Time

# VARIABLES
var clock_minutes = 0
var clock_hours = 0
var start_time = 8
var end_time = 16

func _ready():
	day_label.text = Global.day_of_the_week
	clock_hours = start_time

func _process(_delta):
	if clock_minutes == 60:
		clock_hours += 1
		clock_minutes = 0
	if clock_hours == 16:
		Global.game_has_started = false
		Global.next_day()
	change_clock_time()

func _on_game_game_timer():
		clock_minutes += 60

func change_clock_time():
	var _time : String = "%02d:%02d" % [clock_hours, clock_minutes]
	time_label.text = _time
