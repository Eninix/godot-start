extends KinematicBody2D


# How fast the player will move (pixels/sec).
export var speed = 400
# Size of the game window.
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() <= 0:
		return
	
	velocity = velocity.normalized() * speed
	# false这个选项参数看意思是把无限惯性关了，这个关了之后就不会向碰撞的刚体施加作用力，需要你自己去写
	var info: KinematicCollision2D = move_and_collide(velocity * delta, false)
	if info != null:
		print(info.collider.name)	
