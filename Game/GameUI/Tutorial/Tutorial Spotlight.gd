extends Control

@onready var popup_text = $"../Popup/PopupBubble/RichTextLabel"
@onready var popup_bubble = $"../Popup"

signal truck_tut
signal storm_tut

var called_show = false

# Called when the node enters the scene tree for the first time.
func _ready():
	return;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.tut_active == true:
		if Global.tut_prog == 1:
			$Spotlight.position.x = 270
			$Spotlight.position.y = 200
			$Spotlight.visible = true
			popup_text.text = "This is the clock, pay attention to the colour sections, they indicate the loadshedding schedule."
			show_stop_popup()
			
		elif Global.tut_prog == 2:
			called_show = false
			show_stop_popup()
			$Spotlight.position.x = 1535
			$Spotlight.position.y = 720
			$Spotlight.visible = true
			popup_text.text = "The base of each zone matches the colour on the clock at the times that they have loadshedding."
		
		elif Global.tut_prog == 3:
			$Spotlight.visible = false
			popup_bubble.hide()
			
		elif Global.tut_prog == 4:
			called_show = false
			show_stop_popup()
			popup_text.text = "This is the repair truck event. Just make sure that all of the switches are flipped up to restore power."
		
		elif Global.tut_prog == 5:
			called_show = false
			truck_tut.emit()
			Global.tut_prog = 6
			
		elif Global.tut_prog == 7:  ## clouds
			called_show = false
			show_stop_popup()
			popup_text.text = "This is the storm event. Make sure you click the clouds away before citizens get upset."
			
		elif Global.tut_prog == 8:
			called_show = false
			storm_tut.emit()
			$Spotlight.position.x = 484
			$Spotlight.position.y = 437
			$Spotlight.visible = true
			Global.tut_prog = 9
			
		elif Global.tut_prog == 9:
			$Spotlight.visible = false
			
		elif Global.tut_prog == 10:   ## power 
			$Spotlight.visible = true
			$Spotlight.position.x = 1795
			$Spotlight.position.y = 186
			called_show = false
			show_stop_popup()
			popup_text.text = "This is your remaining power.\nRemember to preserve as much as possible!"
			
		elif Global.tut_prog == 11:
			$Spotlight.visible = false
			Global.tut_prog += 1
			
		elif Global.tut_prog == 12:
			popup_text.text = "Click on the suburb, one of the four zones in the game, to gain more information on the zone's power and happiness."
			called_show = false
			show_stop_popup()
			$Spotlight.visible = true
			$Spotlight.position.x = 1603
			$Spotlight.position.y = 678
			
		elif Global.tut_prog == 13:
			$Spotlight.visible = true
			
		elif Global.tut_prog == 14:
			popup_text.text = "Toggle power ON or OFF. People in the zones with be unhappy when their power is off, and even more so outside of loadshedding!"
			called_show = false
			show_stop_popup()
			$Spotlight.position.x = 1732
			$Spotlight.position.y = 1025
			$Spotlight.visible = true
			
		elif Global.tut_prog == 15:
			$Spotlight.visible = false

func _on_popup_button_pressed():
	Global.tut_prog += 1
	popup_bubble.hide()
	
func show_stop_popup():
	if called_show == false:
		popup_bubble.show()
		called_show = true
