extends Node

# General Variables
var timerCounter = 0
var selectedZone = "none"

# Electricity Variables
var isUsingElectricity = true
var allocatedElectricity = 10000
var electricityUsage = 0
var electricityUsed = 0

# Happiness Variables
var isHappy = true
var maxHappiness
var currentHappiness = 50	# Start at the middle happy point

# Signals
# Sends data to UI to display
signal displayInfo

# Game Functions
func _ready():
	print(name + "s loaded")

func _physics_process(delta):
	timerCounter += delta

func _process(delta):
	# The game updates parameters every second
	if timerCounter > 1:
		UseElectricity()
		HappinessController()
		timerCounter = 0

# Electricity Functions
func UseElectricity():
	if isUsingElectricity:
		electricityUsed += electricityUsage
		allocatedElectricity -= electricityUsage
	else:
		isHappy = false	# If a zone has no power it will be unhappy

# Happiness Functions
func HappinessController():
	if isHappy:
		currentHappiness += 10
	else:
		currentHappiness -= 10
	currentHappiness = clamp(currentHappiness, 0, 100)	# Keeps happiness between 0 and 100
	# If a zone hits 0 happiness the game is over
	if currentHappiness <= 0:
		print("GAME OVER")

# Click methods
func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		# If the event is left mouse click
		if event.pressed and event.button_index == 1:
			# Have to use Zone declaration here otherwise subclasses cannot emit signal for some dumb fucking reason
			selectedZone = name
			Zone.displayInfo.emit(name, electricityUsed, currentHappiness)
