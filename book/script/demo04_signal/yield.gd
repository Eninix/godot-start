extends Button


func _ready():
	self.connect("pressed", self, "onButton")


# yield(obj, signal)，函数立即返回，并且保存当前执行的位置和状态
# yield返回GDScriptFunctionState类型对象，类似于Java的CompleteFuture
# resume恢复GDScriptFunctionState保存的调用函数状态
func onButton():
	var yieldResult1 = doSomething1()
	yieldResult1.resume()
	
	var yieldResult2 = doSomething2()
	# 等待yieldResult2执行完毕
	yield(yieldResult2, "completed")
	print("end")
	

func doSomething1():
	yield()
	print("doSomething")

func doSomething2():
	print(1)
	yield(get_tree().create_timer(1), "timeout")
	print(2)
	yield(get_tree().create_timer(1), "timeout")
	print(3)
	yield(get_tree().create_timer(1), "timeout")
