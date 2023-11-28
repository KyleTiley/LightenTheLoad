extends Node


var background_music = load("res://Audio/mixkit-comical-2.mp3")
var happycitizens = load("res://Audio/mixkit-animated-small-group-applause-523.wav")
var stadiumcrowd = load("res://Audio/mixkit-chanting-sports-crowd-433.wav")
var rainstorm = load("res://Audio/mixkit-forest-rain-loop-1225.wav")
var uibutton = load("res://Audio/mixkit-game-quick-warning-notification-268.wav")
var switchclick = load("res://Audio/mixkit-quick-switch-click-2582.wav")
var repairtruck = load("res://Audio/mixkit-software-interface-start-2574.wav")

var musicProgress = 0.0

func play_music():
	$Music.stream = background_music
	$Music.play()

func play_happy_citizens():
	$SFX.volume_db = 0
	$SFX.stream = happycitizens
	$SFX.play()

func play_stadium_crowd():
	$SFX.volume_db = 0
	$SFX.stream = stadiumcrowd
	$SFX.play()
	
func play_rainstorm():
	$SFX.volume_db = -22
	$SFX.stream = rainstorm
	$SFX.play()
	
func play_ui_button():
	$SFX.volume_db = 1
	$SFX.stream = uibutton
	$SFX.play()
	
func play_switch_click():
	$SFX.volume_db = -5
	$SFX.stream = switchclick
	$SFX.play()
	
func play_repair_truck():
	$SFX.volume_db = 1
	$SFX.stream = repairtruck
	$SFX.play()
	
func stop():
	$SFX.stop()

func stop_if_done():
	await get_tree().create_timer(2).timeout
	$SFX.stop()
