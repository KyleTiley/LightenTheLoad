extends Node3D

signal start_big_game

func _on_events_big_game_event():
	start_big_game.emit()
	# Need to swap out some sort of model or trigger particle effects
