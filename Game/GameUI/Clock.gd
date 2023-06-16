extends Control

# REFERENCES
@onready var timeLabel = $TimeLabel
@onready var dayLabel = $DayLabel

# VARIABLES
var clockCounter = 0
var clockMinutes = 0
# This determines the starting hour of the player's shift
var clockHours = 8

# SIGNALS
#signal DayOver

# FUNCTIONS
func _ready():
	dayLabel.text = Game.dayOfWeek

func _physics_process(delta):
	if(Game.gameHasStarted):
		clockCounter += delta

func _process(_delta):
	if clockCounter > 1:
		# Clock goes up by 5 minutes at a time
		clockMinutes += 5
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
	var time : String = "%02d:%02d" % [clockHours, clockMinutes]
	timeLabel.text = time
