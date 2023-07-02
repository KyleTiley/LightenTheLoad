extends Control

# SIGNALS
signal set_schedule

# VARIABLES
@onready var popup_text = $PopupBubble/RichTextLabel
var daily_event_reminder: String

func _ready():
	# Sets popup variables for each day
	match Global.day_of_the_week:
		"Monday":
			daily_event_reminder = "Good luck for your first day!"
			Global.city_schedule1 = "08"
			Global.city_schedule2 = "12"
			Global.suburb_schedule1 = "10"
			Global.suburb_schedule2 = "14"
			Global.stadium_schedule1 = "12"
			Global.stadium_schedule2 = "16"
			Global.township_schedule1 = "10"
			Global.township_schedule2 = "16"
		"Tuesday":
			daily_event_reminder = "Watch out for cable theft today!"
			Global.city_schedule1 = "10"
			Global.city_schedule2 = "14"
			Global.suburb_schedule1 = "12"
			Global.suburb_schedule2 = "16"
			Global.stadium_schedule1 = "10"
			Global.stadium_schedule2 = "16"
			Global.township_schedule1 = "08"
			Global.township_schedule2 = "14"
		"Wednesday":
			daily_event_reminder = "Weather Forecast: Rainstorms!"
			Global.city_schedule1 = "12"
			Global.city_schedule2 = "16"
			Global.suburb_schedule1 = "10"
			Global.suburb_schedule2 = "14"
			Global.stadium_schedule1 = "08"
			Global.stadium_schedule2 = "16"
			Global.township_schedule1 = "08"
			Global.township_schedule2 = "12"
		"Thursday":
			daily_event_reminder = "Budget has been cut for the rest of the week!"
			Global.city_schedule1 = "10"
			Global.city_schedule2 = "16"
			Global.suburb_schedule1 = "08"
			Global.suburb_schedule2 = "16"
			Global.stadium_schedule1 = "10"
			Global.stadium_schedule2 = "14"
			Global.township_schedule1 = "10"
			Global.township_schedule2 = "16"
		"Friday":
			daily_event_reminder = "Big Game Today at the Stadium!"
			Global.city_schedule1 = "08"
			Global.city_schedule2 = "14"
			Global.suburb_schedule1 = "08"
			Global.suburb_schedule2 = "12"
			Global.stadium_schedule1 = "12"
			Global.stadium_schedule2 = "16"
			Global.township_schedule1 = "10"
			Global.township_schedule2 = "14"
	# Empties text
	popup_text.text = ""
	# Displays all relevent info on the popup
	popup_text.text += "Welcome to " + Global.day_of_the_week + '\n'
	popup_text.text += "Today's loadshedding schedule is:" + '\n'
	popup_text.text += daily_event_reminder
	
	set_schedule.emit(Global.city_schedule1, Global.city_schedule2, Global.suburb_schedule1, Global.suburb_schedule2, Global.stadium_schedule1, Global.stadium_schedule2, Global.township_schedule1, Global.township_schedule2)

# Hides the entire popup and starts the game
func _on_popup_button_pressed():
	hide()
	Global.game_has_started = true
