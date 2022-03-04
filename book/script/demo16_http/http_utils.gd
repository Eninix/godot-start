extends Node2D

const HttpUtils = preload("res://zfoo/util/HttpUtils.gd")

func _ready():
	var util = HttpUtils.new()
	var response = util.get("https://www.zhihu.com")
	print(response)
