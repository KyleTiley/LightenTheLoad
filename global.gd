extends Node

# SCENES

var main_menu = "res://MainMenu/main_menu.tscn"
var game = "res://Game/game.tscn"

# VARIABLES

var day_of_the_week: String
var game_has_started = false
# Sets which days can be played from the main menu
var monday_unlocked = true
var tuesday_unlocked = true
var wednesday_unlocked = false
var thursday_unlocked = false
var friday_unlocked = false

# FUNCTIONS

func change_scene(_scene):
	match _scene:
		"Game":
			get_tree().change_scene_to_file(game)
