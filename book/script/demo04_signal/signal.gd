extends Node2D


# 第一种信号接受方法，通过在场景中配置信号的接收方法
func _on_Button1_pressed():
	print("hello button1")



# 第二种信号接受方法，通过代码控制信号的接受，更加的灵活，比较推荐方式
func _ready():
	$Button2.connect("pressed", self, "onButton2")
	
func onButton2():
	print("button2 pressed")
	
