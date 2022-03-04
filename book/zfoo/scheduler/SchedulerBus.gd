extends Object

const Runnable = preload("res://zfoo/common/Runnable.gd")

const SchedulerDefinition = preload("res://zfoo/scheduler/SchedulerDefinition.gd")
const TimeUtils = preload("res://zfoo/scheduler/TimeUtils.gd")
const ArrayUtils = preload("res://zfoo/util/ArrayUtils.gd")
const CollectionUtils = preload("res://zfoo/util/CollectionUtils.gd")

const schedulerMap: Dictionary = {}


# 固定延迟执行的任务，delay默认为毫秒
static func schedule(runnable: Runnable, delay: int) -> void:
	var triggerTimestamp = TimeUtils.currentTimeMillis() + delay
	var definition = SchedulerDefinition.new(runnable, delay, triggerTimestamp, false)
	schedulerMap[definition] = null


# 不断执行的周期循环任务，delay默认为毫秒
static func scheduleAtFixRate(runnable: Runnable, delay: int) -> void:
	var triggerTimestamp = TimeUtils.currentTimeMillis() + delay
	var definition = SchedulerDefinition.new(runnable, delay, triggerTimestamp, false)
	schedulerMap[definition] = null


static func triggerPerSecond() -> void:
	var timestamp = TimeUtils.currentTimeMillis()
	
	if CollectionUtils.isEmpty(schedulerMap):
		return

	var deleteSchedulers = []
	for scheduler in schedulerMap.keys():
		if timestamp < scheduler.triggerTimestamp:
			continue
		if scheduler.repteated:
				scheduler.triggerTimestamp += timestamp
		else:
			deleteSchedulers.append(scheduler)
		scheduler.runnable.run()
	
	if ArrayUtils.isEmpty(deleteSchedulers):
		return
	
	for scheduler in deleteSchedulers:
		schedulerMap.erase(scheduler)
		scheduler.runnable.free()
		scheduler.free()
