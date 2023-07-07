extends Node3D

@onready var int_cloud = 1

func _on_storm_button_pressed():
	$AnimationPlayer.play("Grow")


func _on_storm_button_2_pressed():
	$AnimationPlayer.play("Shrink")

func _on_button_pressed():
	if int_cloud == 1:
		$".".position.x = $"../../Zones/City".position.x
		$".".position.z = $"../../Zones/City".position.z
		$AnimationPlayer.play("Grow")
	
	if int_cloud == 2:
		$".".position.x = $"../../Zones/Suburb".position.x
		$".".position.z = $"../../Zones/Suburb".position.z
		$AnimationPlayer.play("Grow")
	
	if int_cloud == 3:
		$".".position.x = $"../../Zones/Stadium".position.x
		$".".position.z = $"../../Zones/Stadium".position.z
		$AnimationPlayer.play("Grow")
	
	if int_cloud == 4:
		$".".position.x = $"../../Zones/Township".position.x
		$".".position.z = $"../../Zones/Township".position.z
		$AnimationPlayer.play("Grow")

func _on_events_city_storm():
	$".".position.x = $"../../Zones/City".position.x
	$".".position.z = $"../../Zones/City".position.z
	$AnimationPlayer.play("Grow")


func _on_events_stadium_storm():
	$".".position.x = $"../../Zones/Stadium".position.x
	$".".position.z = $"../../Zones/Stadium".position.z
	$AnimationPlayer.play("Grow")


func _on_events_suburb_storm():
	$".".position.x = $"../../Zones/Suburb".position.x
	$".".position.z = $"../../Zones/Suburb".position.z
	$AnimationPlayer.play("Grow")


func _on_events_township_storm():
	$".".position.x = $"../../Zones/Township".position.x
	$".".position.z = $"../../Zones/Township".position.z
	$AnimationPlayer.play("Grow")
