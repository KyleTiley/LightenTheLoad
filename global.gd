extends Node

# SCENES

var main_menu = "res://MainMenu/main_menu.tscn"
var game = "res://Game/game.tscn"

# VARIABLES

var day_of_the_week: String
var game_has_started = false

# FUNCTIONS

func change_scene(_scene):
	match _scene:
		"Game":
			get_tree().change_scene_to_file(game)

func set_day_values(_day):
	pass
