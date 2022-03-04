extends Node2D

const SchedulerBus = preload("res://zfoo/scheduler/SchedulerBus.gd")

var timeCounter: float = 0

func _physics_process(delta):
	schedulerUpdate(delta)


func schedulerUpdate(delta: float) -> void:
	timeCounter += delta
	if (int(timeCounter) == 1) :
		SchedulerBus.triggerPerSecond()
		timeCounter = 0
