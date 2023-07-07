extends Node


var background_music = load("res://Audio/mixkit-comical-2.mp3")
var happycitizens = load("res://Audio/mixkit-animated-small-group-applause-523.wav")
var stadiumcrowd = load("res://Audio/mixkit-chanting-sports-crowd-433.wav")
var rainstorm = load("res://Audio/mixkit-forest-rain-loop-1225.wav")
var uibutton = load("res://Audio/mixkit-game-quick-warning-notification-268.wav")
var switchclick = load("res://Audio/mixkit-quick-switch-click-2582.wav")

func play_music():
	$Music.stream = background_music
	$Music.play()

func play_happy_citizens():
	$SFX.stream = happycitizens
	$SFX.play()

func play_stadium_crowd():
	$SFX.stream = stadiumcrowd
	$SFX.play()
	
func play_rainstorm():
	$SFX.stream = rainstorm
	$SFX.play()
	
func play_ui_button():
	$SFX.stream = uibutton
	$SFX.play()
	
func play_switch_click():
	$SFX.stream = switchclick
	$SFX.play()
