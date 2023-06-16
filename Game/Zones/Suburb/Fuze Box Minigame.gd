extends Node3D

var switch_off = -40
var switch_on = 40

func _process(delta):
	if Global.switch_counter == 9:
		Global.enable_minigame_retun_button = true
		Global.return_vehicle = true
		%"Window_Minigame".hide()

func _on_button_1_pressed():
	if %"Switch_1".rotation_degrees.x < 0:
		%"Switch_1".rotation_degrees.x = 40
		Global.switch_counter += 1
	elif %"Switch_1".rotation_degrees.x > 0:
		%"Switch_1".rotation_degrees.x = -40
		Global.switch_counter -= 1
	print(Global.switch_counter)

func _on_button_2_pressed():
	if %"Switch_2" .rotation_degrees.x < 0:
		%"Switch_2".rotation_degrees.x = 40
		Global.switch_counter += 1
	elif %"Switch_2".rotation_degrees.x > 0:
		%"Switch_2".rotation_degrees.x = -40
		Global.switch_counter -= 1

func _on_button_3_pressed():
	if %"Switch_3".rotation_degrees.x < 0:
		%"Switch_3".rotation_degrees.x = 40
		Global.switch_counter += 1
	elif %"Switch_3".rotation_degrees.x > 0:
		%"Switch_3".rotation_degrees.x = -40
		Global.switch_counter -= 1

func _on_button_4_pressed():
	if %"Switch_4".rotation_degrees.x < 0:
		%"Switch_4".rotation_degrees.x = 40
		Global.switch_counter += 1
	elif %"Switch_4".rotation_degrees.x > 0:
		%"Switch_4".rotation_degrees.x = -40
		Global.switch_counter -= 1

func _on_button_5_pressed():
	if %"Switch_5".rotation_degrees.x < 0:
		%"Switch_5".rotation_degrees.x = 40
		Global.switch_counter += 1
	elif %"Switch_5".rotation_degrees.x > 0:
		%"Switch_5".rotation_degrees.x = -40
		Global.switch_counter -= 1

func _on_button_6_pressed():
	if %"Switch_6".rotation_degrees.x < 0:
		%"Switch_6".rotation_degrees.x = 40
		Global.switch_counter += 1
	elif %"Switch_6".rotation_degrees.x > 0:
		%"Switch_6".rotation_degrees.x = -40
		Global.switch_counter -= 1

func _on_button_7_pressed():
	if %"Switch_7".rotation_degrees.x < 0:
		%"Switch_7".rotation_degrees.x = 40
		Global.switch_counter += 1
	elif %"Switch_7".rotation_degrees.x > 0:
		%"Switch_7".rotation_degrees.x = -40
		Global.switch_counter -= 1

func _on_button_8_pressed():
	if %"Switch_8".rotation_degrees.x < 0:
		%"Switch_8".rotation_degrees.x = 40
		Global.switch_counter += 1
	elif %"Switch_8".rotation_degrees.x > 0:
		%"Switch_8".rotation_degrees.x = -40
		Global.switch_counter -= 1

func _on_button_9_pressed():
	if %"Switch_9".rotation_degrees.x < 0:
		%"Switch_9".rotation_degrees.x = 40
		Global.switch_counter += 1
	elif %"Switch_9".rotation_degrees.x > 0:
		%"Switch_9".rotation_degrees.x = -40
		Global.switch_counter -= 1

func _on_window_minigame_visibility_changed():
	Global.switch_counter = 0
	
	%"Switch_1".rotation_degrees.x = switch_off
	%"Switch_2".rotation_degrees.x = switch_on
	%"Switch_3".rotation_degrees.x = switch_off
	%"Switch_4".rotation_degrees.x = switch_off
	%"Switch_5".rotation_degrees.x = switch_off
	%"Switch_6".rotation_degrees.x = switch_off
	%"Switch_7".rotation_degrees.x = switch_on
	%"Switch_8".rotation_degrees.x = switch_off
	%"Switch_9".rotation_degrees.x = switch_off

	if %"Switch_1".rotation_degrees.x > 0:
		Global.switch_counter += 1
	if %"Switch_2".rotation_degrees.x > 0:
		Global.switch_counter += 1
	if %"Switch_3".rotation_degrees.x > 0:
		Global.switch_counter += 1
	if %"Switch_4".rotation_degrees.x > 0:
		Global.switch_counter += 1
	if %"Switch_5".rotation_degrees.x > 0:
		Global.switch_counter += 1
	if %"Switch_6".rotation_degrees.x > 0:
		Global.switch_counter += 1
	if %"Switch_7".rotation_degrees.x > 0:
		Global.switch_counter += 1
	if %"Switch_8".rotation_degrees.x > 0:
		Global.switch_counter += 1
	if %"Switch_9".rotation_degrees.x > 0:
		Global.switch_counter += 1
