extends Sprite


onready var tween = $Tween
onready var targetPosition = get_node("/root/Node2D/TargetPosition")

# Called when the node enters the scene tree for the first time.
func _ready():
	# 会在起始点和终点不断的插值计算
	tween.follow_property(self, "position", get_position(), targetPosition, "position", 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	pass
