extends Control

# VARIABLES

@onready var popup_text = $PopupBubble/RichTextLabel
# Unique variables for each day
var loadshedding_offset
var city_loadshedding_offset = 2
var suburb_loadshedding_offset = 4
var twonship_loadshedding_offset = 6
var stadium_loadshedding_offset = 8
var daily_event_reminder: String

func _ready():
	# Sets unique variables for each day
	match Global.day_of_the_week:
		"Monday":
			loadshedding_offset = 2
			daily_event_reminder = "Good luck for your first day!"
		"Tuesday":
			loadshedding_offset = 4
			daily_event_reminder = "Watch out for cable theft today!"
		"Wednesday":
			loadshedding_offset = 6
			daily_event_reminder = "Weather Forecast: Rainstorms!"
		"Thursday":
			loadshedding_offset = 8
			daily_event_reminder = "Budget has been cut for the rest of the week!"
		"Friday":
			loadshedding_offset = 0
			daily_event_reminder = "Big Game Today at the Stadium!"
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
