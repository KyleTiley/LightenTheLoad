extends Node3D

func _process(delta: float):
	const move_speed = 100.0
	if Global.start_maintanance == true:
		%PathFollow3D.progress += move_speed * delta
		if %PathFollow3D.progress >= 1150:
			Global.maintanance = true
		print(move_speed)

	if Global.return_vehicle == true:
			%PathFollow3D.progress -= move_speed * delta
			if %PathFollow3D.progress <= 10:
				Global.disable_check_buttons = false
				Global.return_vehicle = false
