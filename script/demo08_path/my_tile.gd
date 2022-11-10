extends Node

onready var nav_2d : Navigation2D = $Navigation2D
onready var line_2d : Line2D = $Line2D
onready var player : Sprite = $Player


func _unhandled_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return
		
	var playerPosition = player.global_position
	var mousePosition = event.global_position
	var new_path : = nav_2d.get_simple_path(playerPosition, mousePosition)
	player.path = new_path
	line_2d.points = new_path
