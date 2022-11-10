extends Node2D

const HttpUtils = preload("res://zfoo/util/HttpUtils.gd")

func _ready():
	#doHttpRequest();
	pass


func doHttpRequest():
	var util = HttpUtils.new()
	var response = util.get("https://www.zhihu.com")
	print(response)