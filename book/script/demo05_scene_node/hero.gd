extends Sprite

const StringUtils = preload("res://zfoo/util/StringUtils.gd")


var gameWidth: int
var gameHeight: int
var spriteWidth: int
var spriteHeight: int
	


func _enter_tree():
	windowPositionTest()
	# positionTest()
	# textureTest()
	pass


func _physics_process(delta):
	setupGameWindow()	
	setupSprite()
	positionTopCenter()
	pass

# 屏幕坐标系
func windowPositionTest():
	# 设置游戏屏幕的位置
	# OS.window_position = Vector2(100, 100)
	# OS.window_fullscreen = true
	
	print(StringUtils.format("屏幕大小[{}]", [OS.window_size]))
	print(StringUtils.format("屏幕位置[{}]", [OS.window_position]))
	pass

# 坐标点测试用例
func positionTest():
	print(position)
	print(global_position)
	print(to_global(position))
	print(to_local(global_position))
	pass


func setupGameWindow():
	gameWidth = OS.window_size.x
	gameHeight = OS.window_size.y

func setupSprite():
	spriteWidth = texture.get_width()
	spriteHeight = texture.get_height()

	
func positionTopCenter() -> void:
	#get_parent().position.x = 0
	#get_parent().position.y = 0
	#self.global_position
	self.position.x = gameWidth / 2
	self.position.y = spriteHeight / 2

func positionCenter() -> void:
	self.global_position.x = gameWidth / 2
	self.global_position.y = gameHeight / 2

func positionBottomCenter() -> void:
	self.global_position.x = gameWidth / 2
	self.global_position.y = gameHeight - spriteHeight / 2

func positionLeftCenter() -> void:
	self.global_position.x = spriteWidth / 2
	self.global_position.y = gameHeight / 2
	
	

# 纹理测试用例
func textureTest():
	var texture = get_texture()
	var image = texture.get_data()
	print(offset)
	print("texture type: ", texture)
	print("height: ", texture.get_height())
	print("width: ", texture.get_width())
	print("Image data property: ", image.data)

	# 无法直接编辑图片
	image.shrink_x2()
	print("new image data property",image.data)
	#这样做会破坏项目的资源，使资源变得混乱
	image.save_png("C:\\Users\\jaysunxiao\\Desktop\\newImage.png")
	pass
