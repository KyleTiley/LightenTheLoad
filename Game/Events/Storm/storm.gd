extends Node3D

@onready var int_cloud = 1
@onready var int_storm_shrink = 0
@onready var popup_text = $"../../../GameUI/Popup/PopupBubble/RichTextLabel"
@onready var popup = $"../../../GameUI/Popup"

func _on_storm_button_pressed():
	$AnimationPlayer.play("Grow")

func _on_storm_button_2_pressed():
	$AnimationPlayer.play("Shrink")

func _on_events_city_storm():
	$".".position.x = $"../../Zones/City".position.x
	$".".position.z = $"../../Zones/City".position.z
	$".".position.y = 11
	$AnimationPlayer.play("Grow")
	MusicController.play_rainstorm()
	if Global.day_of_the_week == "Tutorial":
		popup_text.text = "Oh no!\n A storm, click on the cloud to remove it"
		popup.show()

func _on_events_stadium_storm():
	$".".position.x = $"../../Zones/Stadium".position.x
	$".".position.z = $"../../Zones/Stadium".position.z
	$".".position.y = 10
	$AnimationPlayer.play("Grow")
	MusicController.play_rainstorm()
	if Global.day_of_the_week == "Tutorial":
		popup_text.text = "Oh no!\n A storm, click on the cloud to remove it"
		popup.show()

func _on_events_suburb_storm():
	$".".position.x = $"../../Zones/Suburb".position.x
	$".".position.z = $"../../Zones/Suburb".position.z
	$".".position.y = 12
	$AnimationPlayer.play("Grow")
	MusicController.play_rainstorm()
	if Global.day_of_the_week == "Tutorial":
		popup_text.text = "Oh no!\n A storm, click on the cloud to remove it"
		popup.show()

func _on_events_township_storm():
	$".".position.x = $"../../Zones/Township".position.x
	$".".position.z = $"../../Zones/Township".position.z
	$".".position.y = 12
	$AnimationPlayer.play("Grow")
	MusicController.play_rainstorm()
	if Global.day_of_the_week == "Tutorial":
		popup_text.text = "Oh no!\n A storm, click on the cloud to remove it"
		popup.show()

func _on_area_cloud_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			int_storm_shrink += 1
			if int_storm_shrink == 3:
				$AnimationPlayer.play("Shrink")
				int_storm_shrink = 0
				MusicController.stop()
				if Global.day_of_the_week == "Tutorial":
					popup_text.text = "Well done!!!\nThe cloud is gone!"
					popup.show()
