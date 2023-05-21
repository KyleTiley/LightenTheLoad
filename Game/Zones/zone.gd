extends Node

#Electricity Variables
var isUsingElectricity = true
var electricityUsage = 0
var electricityUsed = 0

#Happiness Variables
var maxHappiness
var currentHappiness

#Signals
signal displayInfo

#Game Functions
func _ready():
	pass

func _process(delta):
	UseElectricity()

#Electricity Functions
func UseElectricity():
	electricityUsed += electricityUsage

#Happiness Functions
func IncreaseHappiness():
	currentHappiness = clamp(currentHappiness, 0, 100)

#Click methods
func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		# if the event is left mouse click
		if event.pressed and event.button_index == 1:
			# have to use Zone declaration here otherwise subclasses cannot emit signal for some dumb fucking reason
			Zone.displayInfo.emit(name, electricityUsed)
