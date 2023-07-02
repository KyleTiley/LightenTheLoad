extends Node

# SCENES

var main_menu = "res://MainMenu/main_menu.tscn"
var game = "res://Game/game.tscn"

# VARIABLES

var day_of_the_week: String
var game_has_started = false
var total_allocated_electricity
var numberOfEvents

# Sets which days can be played from the main menu
var monday_unlocked = true
var tuesday_unlocked = false
var wednesday_unlocked = false
var thursday_unlocked = false
var friday_unlocked = false

var city_schedule1
var city_schedule2
var suburb_schedule1
var suburb_schedule2
var stadium_schedule1
var stadium_schedule2
var township_schedule1
var township_schedule2

# FUNCTIONS

func change_scene(_scene):
	match _scene:
		"Game":
			get_tree().change_scene_to_file(game)
		"MainMenu":
			game_has_started = false
			get_tree().change_scene_to_file(main_menu)

# Sets variables for the next day
func next_day():
	match day_of_the_week:
		"Monday":
			day_of_the_week = "Tuesday"
			tuesday_unlocked = true
		"Tuesday":
			day_of_the_week = "Wednesday"
			wednesday_unlocked = true
		"Wednesday":
			day_of_the_week = "Thursday"
			thursday_unlocked = true
		"Thursday":
			day_of_the_week = "Friday"
			friday_unlocked = true
		"Friday":
			pass
	change_scene("Game")
