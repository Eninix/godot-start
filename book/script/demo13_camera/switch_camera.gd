extends Node2D

const StringUtils = preload("res://zfoo/util/StringUtils.gd")

var camera1: Camera2D
var camera2: Camera2D
var camera3: Camera2D
var camera4: Camera2D

var timerCounter = 0

func _ready() -> void:
	camera1 = get_node("Camera2D1")
	camera2 = get_node("Camera2D2")
	camera3 = get_node("Camera2D3")
	camera4 = get_node("Camera2D4")


func _physics_process(delta: float) -> void:
	timerCounter += 1
	if(timerCounter == 100):
		switchCamera1()
	if(timerCounter == 200):
		switchCamera2()
	if(timerCounter == 300):
		switchCamera3()
	if(timerCounter == 400):
		switchCamera4()
		timerCounter = 0
	


func switchCamera1() -> void:
	camera1.current = true;
	print("camera1---------------------------")
	postionTest()

func switchCamera2() -> void:
	camera2.current = true;
	print("camera2---------------------------")
	postionTest()

func switchCamera3() -> void:
	camera3.current = true;
	print("camera3---------------------------")
	postionTest()

func switchCamera4() -> void:
	camera4.current = true;
	print("camera4---------------------------")
	postionTest()

func postionTest():
	print(StringUtils.format("全局坐标[{}]", [$icon.global_position]))
	print(StringUtils.format("屏幕坐标[{}]", [$icon.get_global_transform_with_canvas().get_origin()]))
