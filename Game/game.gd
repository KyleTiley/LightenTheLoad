extends Node

# VARIABLES
var gameHasStarted = false
var selectedZone: String

# SIGNALS
# Sends data to UI to display
signal displayInfo

# FUNCTIONS
func _ready():
	Zone.ZoneClicked.connect(SelectZone)
	GameUI.TogglePower.connect(_on_game_ui_toggle_power)
	
func _process(_delta):
	SelectZone(selectedZone)

# Emits display info based on the recently selected Zone
func SelectZone(_name):
	selectedZone = _name
	match selectedZone:
		"City":
			displayInfo.emit(selectedZone, City.electricityUsed, City.currentHappiness)
		"Township":
			displayInfo.emit(selectedZone, Township.electricityUsed, Township.currentHappiness)
		"Suburb":
			displayInfo.emit(selectedZone, Suburb.electricityUsed, Suburb.currentHappiness)
		"Stadium":
			displayInfo.emit(selectedZone, Stadium.electricityUsed, Stadium.currentHappiness)

func _on_game_ui_toggle_power():
	print(selectedZone)
	match selectedZone:
		"City":
			City.isUsingElectricity = !City.isUsingElectricity
		"Township":
			Township.isUsingElectricity = !Township.isUsingElectricity
		"Suburb":
			Suburb.isUsingElectricity = !Suburb.isUsingElectricity
		"Stadium":
			Stadium.isUsingElectricity = !Stadium.isUsingElectricity
