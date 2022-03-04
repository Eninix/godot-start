extends Node2D


# 导出一个数字
export var a = 1
# 导出一个节点路径
export var b:NodePath
# 导出一个节点路径，不同的写法
export(NodePath) var c
# 导出一个文件路径
export(String, FILE) var e 
# 导出一个文件路径，以txt结尾
export(String, FILE, "*.txt") var d
# 导出一个资源文件路径
export(Resource) var f
# 导出一个颜色
export(Color, RGB) var g

func _init():
	print("init")
	

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	print("new一个对象--------------------------------")
	var myClass = MyClass.new()
	print(myClass.to_string())
	
	print("数据类型信息--------------------------------")
	myClass.typeInfo()
	
	print("基础语法if else--------------------------------")
	myClass.if_function(1, 2)
	
	print("基础语法switch--------------------------------")
	myClass.switch_function()
	
	print("基础语法while for--------------------------------")
	myClass.loop_function()
	
	print("数组遍历--------------------------------")	
	myClass.arrayIterator()
	
	print("字典遍历--------------------------------")	
	myClass.dictionaryIterator()
	
	print("访问静态变量--------------------------------")
	var answer = MyClass.ANSWER
	print("访问const变量，类似于static变量：" + answer as String)
	
	print("调用静态方法--------------------------------")
	print("调用静态方法：" + MyClass.getAnswer() as String)
	

	print("内部类测试--------------------------------")
	myClass.innerClassTest()


