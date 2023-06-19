extends Node3D

# REFERENCES
@onready var db_board = load("res://Game/Events/RepairTruck/DBBoard/db_board.tscn")

# VARIABLES

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
	var new_db_board = db_board.instantiate()
	add_child(new_db_board)
	new_db_board.hide()

func _process(delta):
	const move_speed = 50.0




func _on_events_repair_truck_event():
	spawn_db_board()
