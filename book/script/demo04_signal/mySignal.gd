extends Button


# 自定义信号
signal mySignal(a, b)

# 发送信号
# emit_signal("mySignal", 1, 2)
# disconnect("mySignal", 1, 2)

# 类似于设计模式中的观察者
func _ready():
	self.connect("mySignal", self, "onMySingalCallback")
	self.connect("pressed", self, "onButton")


func onMySingalCallback(a, b):
	print("a:" + a as String)
	print("b:" + b as String)
	
func onButton():
	emit_signal("mySignal", 1, 2)
