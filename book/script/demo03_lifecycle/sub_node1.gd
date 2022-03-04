extends Node2D


func _enter_tree():
	# When the node enters the Scene Tree, it becomes active
	# and  this function is called. Children nodes have not entered
	# the active scene yet. In general, it's better to use _ready()
	# for most cases.
	print("sub node1 _enter_tree")

func _ready():
	# This function is called after _enter_tree, but it ensures
	# that all children nodes have also entered the Scene Tree,
	# and became active.
	print("sub node1 _ready")
	#nodeUsage()

func _exit_tree():
	# When the node exits the Scene Tree, this function is called.
	# Children nodes have all exited the Scene Tree at this point
	# and all became inactive.
	print("sub node1 _exit_tree")

func _process(delta):
	# This function is called every frame.
	pass

func _physics_process(delta):
	# This is called every physics frame.
	pass

# 申明和存储节点，等价于在_ready()下赋值
onready var readySubNode = $SubNode2

func nodeUsage():
	# 获取当前节点
	var currentNode1 = $"."
	var currentNode2 = self
	# 获取父节点
	var parentNode1 = get_parent()
	var parentNode2 = $"../"
	# 获取子节点
	var subNode1 = $SubNode2
	var subNode2 = $"SubNode2"
	var subNode3 = get_node("SubNode2")
	# 根节点查找法，会返回节点树从上到下找到的第一个节点
	var subNode4 = get_tree().root.find_node("SubNode2", true, false)
	print(currentNode1.name)
	print(currentNode2.name)
	print(parentNode1.name)
	print(parentNode2.name)
	print(subNode1.name)
	print(subNode2.name)
	print(subNode3.name)
	print(subNode4.name)
