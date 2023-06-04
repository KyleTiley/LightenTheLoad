extends Node


# VARIABLES
var selectedZone: String

# SIGNALS
# Sends data to UI to display
signal displayInfo

# FUNCTIONS
func _ready():
	Zone.ZoneClicked.connect(SelectZone)

func _process(_delta):
	SelectZone(selectedZone)

func SelectZone(_name):
	selectedZone = _name
	match _name:
		"City":
			displayInfo.emit(selectedZone, City.electricityUsed, City.currentHappiness)
		"Township":
			displayInfo.emit(selectedZone, Township.electricityUsed, Township.currentHappiness)
		"Suburb":
			displayInfo.emit(selectedZone, Suburb.electricityUsed, Suburb.currentHappiness)
		"Stadium":
			displayInfo.emit(selectedZone, Stadium.electricityUsed, Stadium.currentHappiness)
