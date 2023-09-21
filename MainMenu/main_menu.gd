extends Node

# REFERENCES

@onready var button_container = $PlayMenu/ButtonContainer
@onready var tutorial_button = $PlayMenu/ButtonContainer/VBoxContainer/ButtonTutorial
@onready var monday_button = $PlayMenu/ButtonContainer/VBoxContainer/ButtonMonday
@onready var tuesday_button = $PlayMenu/ButtonContainer/VBoxContainer/ButtonTuesday
@onready var wednesday_button = $PlayMenu/ButtonContainer/VBoxContainer/ButtonWednesday
@onready var thursday_button = $PlayMenu/ButtonContainer/VBoxContainer/ButtonThursday
@onready var friday_button = $PlayMenu/ButtonContainer/VBoxContainer/ButtonFriday

# FUNCTIONS

func _ready():
	if Global.tutorial_unlocked:
		tutorial_button.disabled = false
	if Global.monday_unlocked:
		monday_button.disabled = false
	if Global.tuesday_unlocked:
		tuesday_button.disabled = false
	if Global.wednesday_unlocked:
		wednesday_button.disabled = false
	if Global.thursday_unlocked:
		thursday_button.disabled = false
	if Global.friday_unlocked:
		friday_button.disabled = false
		
	MusicController.play_music()

func StartGame():
	Global.change_scene("Game")

func StartTutorial():
	Global.change_scene("Tutorial")

# Buttons to start each day from the menu

func _on_button_tutorial_pressed():
	Global.day_of_the_week = "Tutorial"
	StartTutorial()
	MusicController.play_ui_button()
	
func _on_button_monday_pressed():
	Global.day_of_the_week = "Monday"
	StartGame()
	MusicController.play_ui_button()

func _on_button_tuesday_pressed():
	Global.day_of_the_week = "Tuesday"
	StartGame()
	MusicController.play_ui_button()

func _on_button_wednesday_pressed():
	Global.day_of_the_week = "Wednesday"
	StartGame()
	MusicController.play_ui_button()

func _on_button_thursday_pressed():
	Global.day_of_the_week = "Thursday"
	StartGame()
	MusicController.play_ui_button()

func _on_button_friday_pressed():
	Global.day_of_the_week = "Friday"
	StartGame()
	MusicController.play_ui_button()

func _on_play_button_pressed():
	button_container.show()
	MusicController.play_ui_button()

func _on_settings_button_pressed():
	print("OPTIONS")
	MusicController.play_ui_button()


