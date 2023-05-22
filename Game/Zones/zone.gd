extends Node

# General Variables
var timerCounter = 0

# Electricity Variables
var isUsingElectricity = true
var electricityUsage = 0
var electricityUsed = 0

# Happiness Variables
var isHappy = true
var maxHappiness
var currentHappiness = 0

# Signals
# Sends data to UI to display
signal displayInfo

# Game Functions
func _ready():
	print(name + "s loaded")

func _physics_process(delta):
	timerCounter += delta

func _process(delta):
	if timerCounter > 10:
		UseElectricity()
		HappinessController()
		timerCounter = 0

# Electricity Functions
func UseElectricity():
	if isUsingElectricity:
		electricityUsed += electricityUsage

# Happiness Functions
func HappinessController():
	if isHappy:
		currentHappiness += 10
	else:
		currentHappiness -= 10
	currentHappiness = clamp(currentHappiness, 0, 100)

# Click methods
func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		# If the event is left mouse click
		if event.pressed and event.button_index == 1:
			# Have to use Zone declaration here otherwise subclasses cannot emit signal for some dumb fucking reason
			Zone.displayInfo.emit(name, electricityUsed, currentHappiness)
