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
	if Global.tut_prog == 1:
		$Spotlight.position.x = 270
		$Spotlight.position.y = 200
		$Spotlight.visible = true
		popup_text.text = "This is the clock, pay attention to the color sections on the clock!"
		popup_bubble.show()
	if Global.tut_prog == 2:
		$Spotlight.position.x = 1535
		$Spotlight.position.y = 720
		$Spotlight.visible = true
		popup_text.text = "The base of each zone matches the color on the clock at the times they have loadshedding."
		popup_bubble.show()
		
	if Global.tut_prog == 3:
		$Spotlight.visible = false
		popup_bubble.hide()
		
	if Global.tut_prog == 4:
		popup_bubble.show()
		popup_text.text = "This is the repair truck event. Just make sure all the switches are turned on!"
		
	if Global.tut_prog == 5:
		truck_tut.emit()
		popup_bubble.hide()

func _on_popup_button_pressed():
	Global.tut_prog += 1
