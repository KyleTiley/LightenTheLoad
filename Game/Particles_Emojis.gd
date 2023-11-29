extends Node3D

@onready var _suburb_angry = $Suburb
@onready var _town_angry = $Town
@onready var _city_angry = $City
@onready var _stadium_angry = $Stadium

@onready var _suburb_happy = $Suburb2
@onready var _town_happy = $Town2
@onready var _city_happy = $City2
@onready var _stadium_happy = $Stadium2

@onready var hap_suburb = $"../GameWorld/Zones/Suburb"
@onready var hap_city = $"../GameWorld/Zones/City"
@onready var hap_stadium = $"../GameWorld/Zones/Stadium"
@onready var hap_town = $"../GameWorld/Zones/Township"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	Suburb()
	
	Stadium()
	
	City()
	
	Town()

func Suburb():
	if hap_suburb.current_happiness > 80:
		_suburb_angry.emitting = false
		_suburb_happy.emitting = true
	elif hap_suburb.current_happiness < 20:
		_suburb_angry.emitting = true
		_suburb_happy.emitting = false
	else:
		_suburb_angry.emitting = false
		_suburb_happy.emitting = false

func Stadium():
	if hap_stadium.current_happiness > 80:
		_stadium_angry.emitting = false
		_stadium_happy.emitting = true
	elif hap_stadium.current_happiness < 20:
		_stadium_angry.emitting = true
		_stadium_happy.emitting = false
	else:
		_stadium_angry.emitting = false
		_stadium_happy.emitting = false
		

func City():
	if hap_city.current_happiness > 80:
		_city_angry.emitting = false
		_city_happy.emitting = true
	elif hap_city.current_happiness < 20:
		_city_angry.emitting = true
		_city_happy.emitting = false
	else:
		_city_angry.emitting = false
		_city_happy.emitting = false


func Town():
	if hap_town.current_happiness > 80:
		_town_angry.emitting = false
		_town_happy.emitting = true
	elif hap_town.current_happiness < 20:
		_town_angry.emitting = true
		_town_happy.emitting = false
	else:
		_town_angry.emitting = false
		_town_happy.emitting = false
