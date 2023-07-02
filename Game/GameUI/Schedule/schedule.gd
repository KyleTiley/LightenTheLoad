extends Control

func _on_popup_set_schedule(city1, city2, suburb1, suburb2, stadium1, stadium2, township1, township2):
	var schedule_text = $LoadSheddingSchedule
	schedule_text.text = ""
	
	schedule_text.text += "City:" + '\n'
	schedule_text.text += city1 + ":00" + " - " + str(int(city1) + 2 ) + ":30" + '\n'
	schedule_text.text += city2 + ":00" + " - " + str(int(city2) + 2 ) + ":30" + '\n'
	schedule_text.text += '\n'
	schedule_text.text += "Suburb:" + '\n'
	schedule_text.text += suburb1 + ":00" + " - " + str(int(suburb1) + 2 ) + ":30" + '\n'
	schedule_text.text += suburb2 + ":00" + " - " + str(int(suburb2) + 2 ) + ":30" + '\n'
	schedule_text.text += '\n'
	schedule_text.text += "Stadium:" + '\n'
	schedule_text.text += stadium1 + ":00" + " - " + str(int(stadium1) + 2 ) + ":30" + '\n'
	schedule_text.text += stadium2 + ":00" + " - " + str(int(stadium2) + 2 ) + ":30" + '\n'
	schedule_text.text += '\n'
	schedule_text.text += "Township:" + '\n'
	schedule_text.text += township1 + ":00" + " - " + str(int(township1) + 2 ) + ":30" + '\n'
	schedule_text.text += township2 + ":00" + " - " + str(int(township2) + 2 ) + ":30"