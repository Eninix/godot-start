extends Node2D

const SchedulerTest = preload("res://zfoo/test/scheduler/SchedulerTest.gd")
const IdUtilsTest = preload("res://zfoo/test/util/IdUtilsTest.gd")

func _ready():
	SchedulerTest.test()
	IdUtilsTest.test()


