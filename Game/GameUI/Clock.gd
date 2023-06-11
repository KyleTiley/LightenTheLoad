extends Control

# REFERENCES
@onready var label = $Label

# VARIABLES
var clockCounter = 0
var clockMinutes = 0
# This determines the starting hour of the player's shift
var clockHours = 8

# SIGNALS
#signal DayOver

# FUNCTIONS
func _physics_process(delta):
	if(Game.gameHasStarted):
		clockCounter += delta

func _process(_delta):
	if clockCounter > 1:
		clockMinutes += 1
		clockCounter = 0
	if clockMinutes == 60:
		clockMinutes = 0
		clockHours += 1
	if clockHours == 16:
		print("SHIFT OVER")
	# Update the clock
	ChangeClockText()

func ChangeClockText():
	# Formats the clock
	var timeLabel : String = "%02d:%02d" % [clockHours, clockMinutes]
	label.text = timeLabel
