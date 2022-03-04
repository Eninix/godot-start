extends Button

func _ready():
	self.connect("pressed", self, "onButton2")
	
func onButton2():
	var myThread = Thread.new()
	
	print("Create Thread Id: ", myThread)
	print("Thread Active: ", myThread.is_active())
	
	myThread.start(self, "threadTest", null, 0)
	
	print()
	print("Thread Active: ", myThread.is_active())
	
	var waitForThread = myThread.wait_to_finish() # wait for our thread to finish before moving on
	
	print()
	print("Thread is Finished with result: ", waitForThread)
	print("Thread Active: ", myThread.is_active())
	



# 使用thread运行的函数必须有一个参数，要不然无法运行
func threadTest(param):
	print("thread test start")
	return 999
