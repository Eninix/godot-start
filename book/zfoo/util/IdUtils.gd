extends Object


const atomicInt: Array = [0]

const mutex = [false, null]

static func getMutex() -> Mutex:
	if mutex[0]:
		return mutex[1]
	var mutexInstance = Mutex.new()
	mutex[1] = mutexInstance
	return mutexInstance
	

# 获取本地int的唯一id，如果达到最大值则重新从最小值重新计算，线程安全
static func getLocalIntId() -> int:
	var mutexInstance = getMutex()
	
	mutexInstance.lock()
	
	var id = atomicInt[0]
	atomicInt[0] = id + 1
	
	mutexInstance.unlock()
	return id
