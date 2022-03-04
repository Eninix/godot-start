const SchedulerBus = preload("res://zfoo/scheduler/SchedulerBus.gd")
const MySchedulerRunnable = preload("res://zfoo/test/scheduler/MySchedulerRunnable.gd")
const TimeUtils = preload("res://zfoo/scheduler/TimeUtils.gd")


static func test():
	print("-----------------------SchedulerBus-----------------------")
	SchedulerBus.schedule(MySchedulerRunnable.new(), 5000)
