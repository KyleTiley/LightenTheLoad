extends Node3D

# REFERENCES

@onready var db_board = $DBBoard
@onready var truck_path = $Path3D/PathFollow3D
@onready var truck = $Path3D/PathFollow3D/Truck

# VARIABLES

var send_out_truck = false
var new_db_board
var return_truck_driving = false

var maintanance  = false
var start_maintanance  = false
var switch_counter = 0
var vehicle_progress = 0
var g_timer = 10
var reset_mini_game = false
var return_vehicle = false
var disable_check_buttons = false
var enable_minigame_start_button = false
var enable_minigame_retun_button = false

# FUNCTIONS

func _ready():
	db_board.hide()

# Creates a db board instance
#func spawn_db_board():
#	new_db_board = db_board.instantiate()
#	add_child(new_db_board)
	

func _process(delta):
	if send_out_truck:
		drive_truck(delta)
	if return_truck_driving:
		return_truck(delta)

func drive_truck(_delta):
	const move_speed = 10.0
	truck_path.progress += move_speed * _delta
	
	# When the truck reaches the end
	if truck_path.progress_ratio >= 0.95:
		send_out_truck = false
		db_board.show()

func return_truck(_delta):
	# Rotates truck before returning
	const move_speed = 10.0
	truck.rotation_degrees.y = 0
	if truck_path.progress_ratio >= 0.1:
		truck_path.progress -= move_speed * _delta

func _on_db_board_return_vehicle():
	db_board.hide()
	return_truck_driving = true
	MusicController.play_repair_truck()
	MusicController.stop_if_done()

func _on_events_city_truck():
	send_out_truck = true
	MusicController.play_repair_truck()
	MusicController.stop_if_done()

func _on_events_stadium_truck():
	send_out_truck = true
	MusicController.play_repair_truck()
	MusicController.stop_if_done()

func _on_events_suburb_truck():
	send_out_truck = true
	MusicController.play_repair_truck()
	MusicController.stop_if_done()

func _on_events_township_truck():
	send_out_truck = true
	MusicController.play_repair_truck()
	MusicController.stop_if_done()

func _on_tutorial_spotlight_truck_tut():
	send_out_truck = true
	MusicController.play_repair_truck()
	MusicController.stop_if_done()
