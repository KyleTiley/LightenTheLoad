extends Control

# SIGNALS
signal toggle_power

# REFERENCES
@onready var game_info = $GameInfo
@onready var power_button = $PowerButton
@onready var power_left_label = $PowerLeftLabel
@onready var power_bar = $TextureProgressBar

# VARIABLES
var should_display_info = false
var selected_zone
var is_using_electricity
var electricity_used
var current_happiness

var starting_elec : int
var current_elec : float

# FUNCTIONS
func _ready():
	starting_elec = Global.total_allocated_electricity

func _process(_delta):
	current_elec = starting_elec - Global.total_allocated_electricity
	var elec_ratio = current_elec / starting_elec
	power_bar.value = int(elec_ratio*100)
	power_left_label.text = str(Global.total_allocated_electricity)
	if should_display_info:
		display_info(selected_zone, is_using_electricity, electricity_used, current_happiness)

func display_info(_name, _using_electricity, _electricity, _happiness):
	power_button.show()
	game_info.text = ""
	game_info.text += _name + " has used " + str(_electricity) + " units of electricity" + '\n'
	game_info.text += " and is at " + str(_happiness) + " happiness"
	power_button.visible = true
	if _using_electricity:
		power_button.text = "Power:" + '\n' + "ON"
	else:
		power_button.text = "Power:" + '\n' + "OFF"

func _on_power_button_pressed():
	toggle_power.emit()
	print("POWER TOGGLED")
	MusicController.play_ui_button()

func _on_game_display_info(_selected_zone, _is_using_electricity, _electricity_used, _current_happiness):
	should_display_info = true
	selected_zone = _selected_zone
	is_using_electricity = _is_using_electricity
	electricity_used = _electricity_used
	current_happiness = _current_happiness
	display_info(selected_zone, is_using_electricity, electricity_used, current_happiness)
