extends Control

@onready var day_label = $Day
@onready var time_label = $Time

func _ready():
	day_label.text = Global.day_of_the_week
