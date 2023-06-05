extends Control

# REFERENCES
@onready var label = $Label

# VARIABLES
var clockCounter = 0
var clockMinutes = 0
var clockHours = 0

# SIGNALS
#signal DayOver

# FUNCTIONS
func _physics_process(delta):
	print(clockCounter)
	clockCounter += delta
	if clockCounter > 1:
		clockMinutes += 1
		clockCounter = 0
	if clockMinutes == 60:
		clockMinutes = 0
		clockHours += 1
	if clockHours == 25:
		clockHours = 0
		print("DAY OVER")
	# Update the clock
	ChangeClockText()

func ChangeClockText():
	label.text = str(clockHours) + ":" + str(clockMinutes)
