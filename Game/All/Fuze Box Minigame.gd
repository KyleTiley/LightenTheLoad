extends Node3D

var switch_off = -40
var switch_on = 40

func _process(delta):
	if Global.switch_counter == 9:
		Global.enable_minigame_retun_button = true
		Global.return_vehicle = true
#		get_tree().change_scene_to_file("res://Game/Events/Cable_Theft/cable_fix.tscn")

func _on_area_3d_1_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_1".rotation_degrees.x < 0:
				%"Switch_1".rotation_degrees.x = 40
				Global.switch_counter += 1
			elif %"Switch_1".rotation_degrees.x > 0:
				%"Switch_1".rotation_degrees.x = -40
				Global.switch_counter -= 1
			print(Global.switch_counter)

func _on_area_3d_2_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_2" .rotation_degrees.x < 0:
				%"Switch_2".rotation_degrees.x = 40
				Global.switch_counter += 1
			elif %"Switch_2".rotation_degrees.x > 0:
				%"Switch_2".rotation_degrees.x = -40
				Global.switch_counter -= 1

func _on_area_3d_3_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_3".rotation_degrees.x < 0:
				%"Switch_3".rotation_degrees.x = 40
				Global.switch_counter += 1
			elif %"Switch_3".rotation_degrees.x > 0:
				%"Switch_3".rotation_degrees.x = -40
				Global.switch_counter -= 1

func _on_area_3d_4_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_4".rotation_degrees.x < 0:
				%"Switch_4".rotation_degrees.x = 40
				Global.switch_counter += 1
			elif %"Switch_4".rotation_degrees.x > 0:
				%"Switch_4".rotation_degrees.x = -40
				Global.switch_counter -= 1

func _on_area_3d_5_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_5".rotation_degrees.x < 0:
				%"Switch_5".rotation_degrees.x = 40
				Global.switch_counter += 1
			elif %"Switch_5".rotation_degrees.x > 0:
				%"Switch_5".rotation_degrees.x = -40
				Global.switch_counter -= 1

func _on_area_3d_6_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_6".rotation_degrees.x < 0:
				%"Switch_6".rotation_degrees.x = 40
				Global.switch_counter += 1
			elif %"Switch_6".rotation_degrees.x > 0:
				%"Switch_6".rotation_degrees.x = -40
				Global.switch_counter -= 1

func _on_area_3d_7_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_7".rotation_degrees.x < 0:
				%"Switch_7".rotation_degrees.x = 40
				Global.switch_counter += 1
			elif %"Switch_7".rotation_degrees.x > 0:
				%"Switch_7".rotation_degrees.x = -40
				Global.switch_counter -= 1

func _on_area_3d_8_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_8".rotation_degrees.x < 0:
				%"Switch_8".rotation_degrees.x = 40
				Global.switch_counter += 1
			elif %"Switch_8".rotation_degrees.x > 0:
				%"Switch_8".rotation_degrees.x = -40
				Global.switch_counter -= 1

func _on_area_3d_9_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_9".rotation_degrees.x < 0:
				%"Switch_9".rotation_degrees.x = 40
				Global.switch_counter += 1
			elif %"Switch_9".rotation_degrees.x > 0:
				%"Switch_9".rotation_degrees.x = -40
				Global.switch_counter -= 1

func _on_node_3d_visibility_changed():
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
