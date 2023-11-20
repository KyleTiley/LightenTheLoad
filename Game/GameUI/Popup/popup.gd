extends Control

# SIGNALS
signal set_schedule

# VARIABLES
@onready var popup_text = $PopupBubble/RichTextLabel
var daily_event_reminder: String
var start_day = true

func _ready():
	# Sets popup variables for each day
	match Global.day_of_the_week:
		"Monday":
			daily_event_reminder = "Welcome to your first day! Follow the loadshedding schedule on the left and try to keep everyone happy as best you can. Good luck!"
			Global.city_schedule1 = "10"
			Global.city_schedule2 = "00"
			Global.suburb_schedule1 = "12"
			Global.suburb_schedule2 = "00"
			Global.stadium_schedule1 = "14"
			Global.stadium_schedule2 = "00"
			Global.township_schedule1 = "16"
			Global.township_schedule2 = "00"
		"Tuesday":
			daily_event_reminder = "Watch out for cable theft today! Repair trucks will be sent out to solve any grid problems, you'll just have to flip the switches up."
			Global.city_schedule1 = "10"
			Global.city_schedule2 = "14"
			Global.suburb_schedule1 = "12"
			Global.suburb_schedule2 = "16"
			Global.stadium_schedule1 = "10"
			Global.stadium_schedule2 = "16"
			Global.township_schedule1 = "08"
			Global.township_schedule2 = "14"
		"Wednesday":
			daily_event_reminder = "Weather Forecast: Rainstorms! If a zone gets a little too cloudy, try clicking away that cumulonimbus before everyone gets too unhappy!"
			Global.city_schedule1 = "08"
			Global.city_schedule2 = "14"
			Global.suburb_schedule1 = "12"
			Global.suburb_schedule2 = "18"
			Global.stadium_schedule1 = "16"
			Global.stadium_schedule2 = "00"
			Global.township_schedule1 = "10"
			Global.township_schedule2 = "00"
		"Thursday":
			daily_event_reminder = "Someone pocketed a part of this week's budget! We will update you when we know how much was lost, for now just be as stingy as possbile!"
			Global.city_schedule1 = "10"
			Global.city_schedule2 = "16"
			Global.suburb_schedule1 = "08"
			Global.suburb_schedule2 = "16"
			Global.stadium_schedule1 = "10"
			Global.stadium_schedule2 = "14"
			Global.township_schedule1 = "10"
			Global.township_schedule2 = "16"
		"Friday":
			daily_event_reminder = "Big Game Today at the Stadium! Everyone will be there, and they will definitely not be happy if they lose power during the game!"
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
#	popup_text.text += "Welcome to " + Global.day_of_the_week + '\n'
	popup_text.text += daily_event_reminder
	
	set_schedule.emit(Global.city_schedule1, Global.city_schedule2, Global.suburb_schedule1, Global.suburb_schedule2, Global.stadium_schedule1, Global.stadium_schedule2, Global.township_schedule1, Global.township_schedule2)

# Hides the entire popup and starts the game
func _on_popup_button_pressed():
	if start_day:
		hide()
		Global.game_has_started = true
	else:
		Global.next_day()
	MusicController.play_ui_button()

func _on_clock_day_over():
	show()
	Global.game_has_started = false
	start_day = false
	# Empties text
	popup_text.text = ""
	# Displays all relevent info on the popup
	popup_text.text += "Congratulations!" + '\n'
	popup_text.text += "You finished your shift on " + Global.day_of_the_week  + '\n'
	popup_text.text += "with " + str(Global.total_allocated_electricity) + " units of electricity left." + '\n'
	popup_text.text += "Start next day?"
