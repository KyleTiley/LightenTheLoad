extends Control

# VARIABLES

@onready var popup_text = $ColorRect/RichTextLabel
# Unique variables for each day
var city_loadshedding_offset
var daily_event_reminder: String

func _ready():
	# Sets unique variables for each day
	match Global.day_of_the_week:
		"Monday":
			city_loadshedding_offset = 1
		"Tuesday":
			city_loadshedding_offset = 2
			daily_event_reminder = "Watch out for cable theft!"
		"Wednesday":
			city_loadshedding_offset = 3
		"Thursday":
			city_loadshedding_offset = 4
		"Friday":
			city_loadshedding_offset = 5
	# Empties text
	popup_text.text = ""
	# Displays all relevent info on the popup
	popup_text.text += "Welcome to " + Global.day_of_the_week + '\n'
	popup_text.text += "Today's loadshedding schedule is:" + '\n'
	popup_text.text += str(city_loadshedding_offset) + '\n'
	popup_text.text += daily_event_reminder

# Hides the entire popup and starts the game
func _on_popup_button_pressed():
	hide()
	Global.game_has_started = true
