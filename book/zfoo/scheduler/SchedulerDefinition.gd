extends Object

const Runnable = preload("res://zfoo/common/Runnable.gd")

# the time from now to delay execution
var delay: int

# 触发时间
var triggerTimestamp: int

# 是否重复
var repteated: bool

# 回调方法
var runnable: Runnable


func _init(runnable: Runnable, delay: int, triggerTimestamp: int, repteated: bool = false):
	self.runnable = runnable
	self.delay = delay
	self.triggerTimestamp = triggerTimestamp
	self.repteated = repteated
