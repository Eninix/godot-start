extends Object


# 一秒钟对应的纳秒数
const NANO_PER_SECOND: int = 1_000_000_000
# 一秒钟对应的毫秒数
const MILLIS_PER_SECOND: int = 1 * 1000
# 一分钟对应的毫秒数
const MILLIS_PER_MINUTE = 1 * 60 * MILLIS_PER_SECOND
# 一个小时对应的毫秒数
const MILLIS_PER_HOUR = 1 * 60 * MILLIS_PER_MINUTE
# 一天对应的毫秒数
const MILLIS_PER_DAY = 1 * 24 * MILLIS_PER_HOUR
# 一周对应的毫秒数
const MILLIS_PER_WEEK = 1 * 7 * MILLIS_PER_HOUR


const timestamp = [0]


# 获取精确的时间戳
static func currentTimeMillis() -> int:
	var currentTimeMillis = OS.get_system_time_msecs()
	timestamp[0] = currentTimeMillis
	return currentTimeMillis


# 获取最多只有一秒延迟的粗略时间戳，适用于对时间精度要求不高的场景，最多只有一秒误差
static func now() -> int:
	return timestamp[0]
