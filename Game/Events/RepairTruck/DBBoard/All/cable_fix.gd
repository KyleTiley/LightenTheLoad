extends Node

var db_board

func _ready():
	var db_board_node = load("res://DB_Board.tscn")
	db_board = db_board_node.instantiate()
	add_child(db_board)
	db_board.hide()

func _process(delta: float):
	const move_speed = 50.0
	
	if %PathFollow3D.progress_ratio >= 0.9:
		%MeshInstance3D.rotation_degrees.y = 180.0
		Global.start_maintanance = false
		Global.disable_check_buttons = false
		db_board.visible = true

	if Global.start_maintanance == true:
		%PathFollow3D.progress += move_speed * delta

	if Global.return_vehicle == true:
		db_board.hide()
		%PathFollow3D.progress -= move_speed * delta
		if %PathFollow3D.progress_ratio <= 0.10:
			%MeshInstance3D.rotation_degrees.y = 0.0
			Global.enable_minigame_start_button = false
			Global.reset_mini_game = true
			Global.return_vehicle = false
			Global.switch_counter = 0




