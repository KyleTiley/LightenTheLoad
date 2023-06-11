extends Node3D

func _process(delta: float):
	const move_speed = 50.0
	
	if %PathFollow3D.progress_ratio >= 0.9:
		%MeshInstance3D.rotation_degrees.y = 180.0
		Global.start_maintanance = false
		Global.disable_check_buttons = false

	if Global.start_maintanance == true:
		%PathFollow3D.progress += move_speed * delta

	if Global.return_vehicle == true:
		%PathFollow3D.progress -= move_speed * delta
		if %PathFollow3D.progress_ratio <= 0.10:
			%MeshInstance3D.rotation_degrees.y = 0.0
			Global.enable_minigame_start_button = false
			Global.reset_mini_game = true
			Global.return_vehicle = false
