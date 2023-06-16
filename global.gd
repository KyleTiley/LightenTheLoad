extends Node

# SCENES

var main_menu = load("res://MainMenu/main_menu.tscn")
var game = load("res://Game/game.tscn") # edit this once refactored

# VARIABLES

var day_of_the_week: String
var game_has_started = false

# FUNCTIONS

func change_scene(_scene):
	get_tree().change_scene(_scene) # might need to make this change_scene_to_file()

func set_day_values(_day):
	pass
