extends Node2D

const RandomUtils = preload("res://zfoo/util/RandomUtils.gd")

var count = 0

func _ready():
	print(RandomUtils.randomBoolean())
	randomize()
	
	
func _process(delta):
	count = count + 1
	if count % 100 == 0:
		randomTest()
	pass
	

func randomTest():
	print(RandomUtils.randomBoolean())
	print(RandomUtils.randomInt())
	print(RandomUtils.randomIntLimit(2))
	print(RandomUtils.randomIntRange(-2147483648, -2147483646))
