extends Node2D

const CNode = preload("res://script/demo02_base/CNode.gd")
const CReference = preload("res://script/demo02_base/CReference.gd")

# monitor初探
func _ready():
	#nodeTest()
	#nodeFreeTest()
	#nodeQueueFreeTest()
	#referenceTest()
	#referenceFreeTest()
	referencUnreferenceTest()
	pass


func nodeTest():
	for i in range(10000):
		var instance = CNode.new()


func nodeFreeTest():
	for i in range(10000):
		var instance = CNode.new()
		instance.free()

# queue_free效率更高	
func nodeQueueFreeTest():
	for i in range(10000):
		var instance = CNode.new()
		instance.queue_free()
		
func referenceTest():
	for i in range(10000):
		var instance = CReference.new()


func referenceFreeTest():
	for i in range(10000):
		var instance = CReference.new()
		instance.free()

func referencUnreferenceTest():
	for i in range(10000):
		var instance = CReference.new()
		instance.unreference()
