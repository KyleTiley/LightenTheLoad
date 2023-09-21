extends Control

# SIGNALS
signal set_schedule

# VARIABLES
@onready var popup_text = $PopupBubble/RichTextLabel
var daily_event_reminder: String
var start_day = true
var tutorial_Int = 0

func _ready():
	# Sets popup variables for each day
	match Global.day_of_the_week:
		"Tutorial":
			daily_event_reminder = "Welcome to LightenTheLoad. \n You can call me MR. Bulby, I will be your guide throughout the tutorial."
			Global.city_schedule1 = "08"
			Global.city_schedule2 = "12"
			Global.suburb_schedule1 = "10"
			Global.suburb_schedule2 = "14"
			Global.stadium_schedule1 = "12"
			Global.stadium_schedule2 = "16"
			Global.township_schedule1 = "10"
			Global.township_schedule2 = "16"
		
		"Monday":
			daily_event_reminder = "Welcome to your first day! Follow the loadshedding schedule on the left and try to keep everyone happy as best you can. Good luck!"
			Global.city_schedule1 = "08"
			Global.city_schedule2 = "12"
			Global.suburb_schedule1 = "10"
			Global.suburb_schedule2 = "14"
			Global.stadium_schedule1 = "12"
			Global.stadium_schedule2 = "16"
			Global.township_schedule1 = "10"
			Global.township_schedule2 = "16"
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
			Global.city_schedule1 = "12"
			Global.city_schedule2 = "16"
			Global.suburb_schedule1 = "10"
			Global.suburb_schedule2 = "14"
			Global.stadium_schedule1 = "08"
			Global.stadium_schedule2 = "16"
			Global.township_schedule1 = "08"
			Global.township_schedule2 = "12"
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
		if Global.day_of_the_week == "Tutorial" && tutorial_Int == 0:
			tutorial_Int += 1
			popup_text.text = "Make use of the load shedding schedule on the left of your screen.\nThe residents wont be unhappy if their power is turned off during the time they expect."
			show()
			return
		elif tutorial_Int == 1:
			tutorial_Int += 1
			popup_text.text = "Click on suburbs to toggle their power preferably in the suggested time zones."
			show()
			return
		elif tutorial_Int == 2:
			tutorial_Int += 1
			popup_text.text = "Some times a storm will break out, spam the clouds with clicks to remove them."
			show()
			return
		elif tutorial_Int == 3:
			tutorial_Int += 1
			popup_text.text = "A repair truck will go to a suburb thats power has tripped, flick all the switches up to turn their power back on."
			show()
			return
		elif tutorial_Int == 4:
			tutorial_Int += 1
			popup_text.text = "On the top left of your screen you will see the clock, when the clock gets to 18:30 the game ends and you win."
			show()
			return
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
