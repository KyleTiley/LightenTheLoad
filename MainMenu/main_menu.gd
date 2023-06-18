extends Node

# REFERENCES

@onready var button_panel = $PlayMenu/PanelContainer
@onready var monday_button = $PlayMenu/PanelContainer/VBoxContainer/ButtonMonday
@onready var tuesday_button = $PlayMenu/PanelContainer/VBoxContainer/ButtonTuesday
@onready var wednesday_button = $PlayMenu/PanelContainer/VBoxContainer/ButtonWednesday
@onready var thursday_button = $PlayMenu/PanelContainer/VBoxContainer/ButtonThursday
@onready var friday_button = $PlayMenu/PanelContainer/VBoxContainer/ButtonFriday

# FUNCTIONS

func _ready():
	if Global.monday_unlocked:
		monday_button.disabled = false
	if Global.tuesday_unlocked:
		tuesday_button.disabled = false

func StartGame():
	Global.change_scene("Game")

# Buttons to start each day from the menu

func _on_button_monday_pressed():
	Global.day_of_the_week = "Monday"
	StartGame()

func _on_button_tuesday_pressed():
	Global.day_of_the_week = "Tuesday"
	StartGame()

func _on_button_wednesday_pressed():
	Global.day_of_the_week = "Wednesday"
	StartGame()

func _on_button_thursday_pressed():
	Global.day_of_the_week = "Thursday"
	StartGame()

func _on_button_friday_pressed():
	Global.day_of_the_week = "Friday"
	StartGame()

func _on_play_button_pressed():
	button_panel.show()

func _on_settings_button_pressed():
	print("OPTIONS")
