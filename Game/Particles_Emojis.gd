extends Node3D

@onready var _suburb_angry = $Suburb
@onready var _town_angry = $Town
@onready var _city_angry = $City
@onready var _stadium_angry = $Stadium

@onready var _suburb_happy = $Suburb2
@onready var _town_happy = $Town2
@onready var _city_happy = $City2
@onready var _stadium_happy = $Stadium2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	Suburb()
	
	Stadium()
	
	City()
	
	Town()

func Suburb():
	_suburb_angry.emitting = false
	_suburb_happy.emitting = true

func Stadium():
	_stadium_angry.emitting = false
	_stadium_happy.emitting = true

func City():
	_city_angry.emitting = true
	_city_happy.emitting = false

func Town():
	_town_angry.emitting = true
	_town_happy.emitting = false
