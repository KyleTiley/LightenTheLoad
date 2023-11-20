extends Control

@onready var popup_text = $"../Popup/PopupBubble/RichTextLabel"
@onready var popup_bubble = $"../Popup"
@onready var popup_button = $"../Popup/PopupBubble/PopupButton"

signal truck_tut
signal storm_tut

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
			popup_text.text = "This is the clock, pay attention to the color sections on the clock!"
			popup_bubble.show()
		elif Global.tut_prog == 2:
			$Spotlight.position.x = 1535
			$Spotlight.position.y = 720
			$Spotlight.visible = true
			popup_text.text = "The base of each zone matches the color on the clock at the times they have loadshedding."
			popup_bubble.show()
		
		elif Global.tut_prog == 3:
			$Spotlight.visible = false
			popup_bubble.hide()
			
		elif Global.tut_prog == 4:
			popup_bubble.show()
			popup_text.text = "This is the repair truck event. Just make sure all the switches are turned on!"
		
		elif Global.tut_prog == 5:
			truck_tut.emit()
			Global.tut_prog = 6
			
		elif Global.tut_prog == 7:
			popup_bubble.show()
			popup_text.text = "This storm event. Make sure you click the clouds away before citizens get upset!"
			
		elif Global.tut_prog == 8:
			storm_tut.emit()
			$Spotlight.position.x = 484
			$Spotlight.position.y = 437
			$Spotlight.visible = true
			Global.tut_prog = 9
			
		elif Global.tut_prog == 9:
			$Spotlight.visible = false
			
		elif Global.tut_prog == 10:
			$Spotlight.visible = true
			$Spotlight.position.x = 1795
			$Spotlight.position.y = 186
			popup_bubble.show()
			popup_text.text = "This is your remaining power!! \n Remember to preserve as much as possible!"
			
		elif Global.tut_prog == 11:
			$Spotlight.visible = false
			Global.tut_prog += 1
			
		elif Global.tut_prog == 12:
			popup_text.text = "Click on the suburb."
			popup_bubble.show()
			$Spotlight.visible = true
			$Spotlight.position.x = 1603
			$Spotlight.position.y = 678
			
		elif Global.tut_prog == 13:
			$Spotlight.visible = true
			
			
		elif Global.tut_prog == 14:
			popup_text.text = "Click here to switch power on/off!"
			popup_bubble.show()
			popup_button.show()
			$Spotlight.position.x = 1732
			$Spotlight.position.y = 1025
			$Spotlight.visible = true
		elif Global.tut_prog == 15:
			$Spotlight.visible = false

func _on_popup_button_pressed():
	Global.tut_prog += 1
	popup_bubble.hide()
	print_debug(Global.tut_prog)
	
