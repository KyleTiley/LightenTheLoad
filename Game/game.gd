extends Node

# VARIABLES
var gameHasStarted = false
var selectedZone = "NULL"
var dayOfWeek: String

# SIGNALS
# Sends data to UI to display
signal displayInfo
signal hideInfo

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
			displayInfo.emit(selectedZone, City.electricityUsed, City.currentHappiness, City.isUsingElectricity)
		"Township":
			displayInfo.emit(selectedZone, Township.electricityUsed, Township.currentHappiness, Township.isUsingElectricity)
		"Suburb":
			displayInfo.emit(selectedZone, Suburb.electricityUsed, Suburb.currentHappiness, Suburb.isUsingElectricity)
		"Stadium":
			displayInfo.emit(selectedZone, Stadium.electricityUsed, Stadium.currentHappiness, Stadium.isUsingElectricity)
		"None":
			hideInfo.emit(selectedZone)
		"NULL":
			hideInfo.emit(selectedZone)

func _on_game_ui_toggle_power():
	match selectedZone:
		"City":
			City.isUsingElectricity = !City.isUsingElectricity
		"Township":
			Township.isUsingElectricity = !Township.isUsingElectricity
		"Suburb":
			Suburb.isUsingElectricity = !Suburb.isUsingElectricity
		"Stadium":
			Stadium.isUsingElectricity = !Stadium.isUsingElectricity

func _on_pop_up_button_pressed():
	# Must use Game. reference here in order to change the global variable
	Game.gameHasStarted = true
	selectedZone = "None"
