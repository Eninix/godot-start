extends Sprite



func _on_Timer_timeout():
	if frame < 5:
		frame += 1
	else:
		frame = 0
