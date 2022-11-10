extends Line2D

func _ready():
	#add_point(Vector2(100, 100))
	#add_point(Vector2(100, 200))
	#add_point(Vector2(200, 200))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_parent().find_node("Player")
	var position = player.position
	add_point(position)
	if (get_point_count() >= 20):
		remove_point(0)
	pass


func pointTest():
	add_point(Vector2(100, 100))
	add_point(Vector2(100, 200))
	add_point(Vector2(200, 200))
	pass
