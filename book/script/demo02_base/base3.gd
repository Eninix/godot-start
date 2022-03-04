extends Node2D

const A = preload("res://script/demo02_base/A.gd")
const B = preload("res://script/demo02_base/B.gd")

func _ready():
	#referenceTest()
	#referenceCycleTest()
	referenceUnreference1Test()
	#referenceUnreference2Test()
	pass


func referenceTest():
	var a = A.new()
	var b = B.new()

func referenceCycleTest():
	var a = A.new()
	var b = B.new()
	a.b = b
	b.a = a


func referenceUnreference1Test():
	var a = A.new()
	var b = B.new()
	a.b = b
	b.a = a
	a.unreference()

func referenceUnreference2Test():
	var a = A.new()
	var b = B.new()
	a.b = b
	b.a = a
	a.unreference()
	b.unreference()
