extends Node3D

# REFERENCES

@onready var db_board = load("res://Game/Events/RepairTruck/DBBoard/db_board.tscn")
@onready var truck_path = $Path3D/PathFollow3D
@onready var truck = $Path3D/PathFollow3D/Truck

# VARIABLES

var send_out_truck = false
var new_db_board

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

# Creates a db board instance
func spawn_db_board():
	new_db_board = db_board.instantiate()
	add_child(new_db_board)
	new_db_board.hide()

func _process(delta):
	const move_speed = 50.0
	if send_out_truck:
		drive_truck(delta)

func _on_events_repair_truck_event():
	print("truck event started")
	spawn_db_board()
	send_out_truck = true

func drive_truck(_delta):
	const move_speed = 10.0
	truck_path.progress += move_speed * _delta
	
	# When the truck reaches the end
	if truck_path.progress_ratio >= 0.95:
		send_out_truck = false
		new_db_board.show()
		return_truck()

func return_truck():
	# Rotates truck before returning
	truck.rotation_degrees.y = 0

