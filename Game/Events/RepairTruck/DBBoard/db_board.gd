extends Node3D

signal return_vehicle

var switch_off = -40
var switch_on = 40

var switch_counter = 0

func _ready():
	_on_node_3d_visibility_changed()

func _process(delta):
	if switch_counter == 9:
		return_vehicle.emit()

func _on_area_3d_1_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_1".rotation_degrees.x < 0:
				%"Switch_1".rotation_degrees.x = 40
				switch_counter += 1
			elif %"Switch_1".rotation_degrees.x > 0:
				%"Switch_1".rotation_degrees.x = -40
				switch_counter -= 1
			print(switch_counter)

func _on_area_3d_2_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_2".rotation_degrees.x < 0:
				%"Switch_2".rotation_degrees.x = 40
				switch_counter += 1
			elif %"Switch_2".rotation_degrees.x > 0:
				%"Switch_2".rotation_degrees.x = -40
				switch_counter -= 1

func _on_area_3d_3_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_3".rotation_degrees.x < 0:
				%"Switch_3".rotation_degrees.x = 40
				switch_counter += 1
			elif %"Switch_3".rotation_degrees.x > 0:
				%"Switch_3".rotation_degrees.x = -40
				switch_counter -= 1

func _on_area_3d_4_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_4".rotation_degrees.x < 0:
				%"Switch_4".rotation_degrees.x = 40
				switch_counter += 1
			elif %"Switch_4".rotation_degrees.x > 0:
				%"Switch_4".rotation_degrees.x = -40
				switch_counter -= 1

func _on_area_3d_5_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_5".rotation_degrees.x < 0:
				%"Switch_5".rotation_degrees.x = 40
				switch_counter += 1
			elif %"Switch_5".rotation_degrees.x > 0:
				%"Switch_5".rotation_degrees.x = -40
				switch_counter -= 1

func _on_area_3d_6_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_6".rotation_degrees.x < 0:
				%"Switch_6".rotation_degrees.x = 40
				switch_counter += 1
			elif %"Switch_6".rotation_degrees.x > 0:
				%"Switch_6".rotation_degrees.x = -40
				switch_counter -= 1

func _on_area_3d_7_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_7".rotation_degrees.x < 0:
				%"Switch_7".rotation_degrees.x = 40
				switch_counter += 1
			elif %"Switch_7".rotation_degrees.x > 0:
				%"Switch_7".rotation_degrees.x = -40
				switch_counter -= 1

func _on_area_3d_8_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_8".rotation_degrees.x < 0:
				%"Switch_8".rotation_degrees.x = 40
				switch_counter += 1
			elif %"Switch_8".rotation_degrees.x > 0:
				%"Switch_8".rotation_degrees.x = -40
				switch_counter -= 1

func _on_area_3d_9_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if %"Switch_9".rotation_degrees.x < 0:
				%"Switch_9".rotation_degrees.x = 40
				switch_counter += 1
			elif %"Switch_9".rotation_degrees.x > 0:
				%"Switch_9".rotation_degrees.x = -40
				switch_counter -= 1

func _on_node_3d_visibility_changed():
	switch_counter = 0

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
		switch_counter += 1
	if %"Switch_2".rotation_degrees.x > 0:
		switch_counter += 1
	if %"Switch_3".rotation_degrees.x > 0:
		switch_counter += 1
	if %"Switch_4".rotation_degrees.x > 0:
		switch_counter += 1
	if %"Switch_5".rotation_degrees.x > 0:
		switch_counter += 1
	if %"Switch_6".rotation_degrees.x > 0:
		switch_counter += 1
	if %"Switch_7".rotation_degrees.x > 0:
		switch_counter += 1
	if %"Switch_8".rotation_degrees.x > 0:
		switch_counter += 1
	if %"Switch_9".rotation_degrees.x > 0:
		switch_counter += 1
