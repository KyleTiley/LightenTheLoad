extends Control

@onready var popupText = $RichTextLabel

func _ready():
	match Game.dayOfWeek:
		"Monday":
			popupText.text = "Welcome to monday"
		"Tuesday":
			popupText.text = "Welcome to tuesday"
		"Wednesday":
			popupText.text = "Welcome to wednesday"
		"Thursday":
			popupText.text = "Welcome to thursday"
		"Friday":
			popupText.text = "Welcome to friday"

func _on_pop_up_button_pressed():
	hide()
