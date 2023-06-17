extends Node

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
