extends Node2D

const NodeUtils = preload("res://zfoo/util/NodeUtils.gd")

func _enter_tree():
	# When the node enters the Scene Tree, it becomes active
	# and  this function is called. Children nodes have not entered
	# the active scene yet. In general, it's better to use _ready()
	# for most cases.
	print("parent _enter_tree")

func _ready():
	# This function is called after _enter_tree, but it ensures
	# that all children nodes have also entered the Scene Tree,
	# and became active.
	print("parent _ready")
	$DeleteButton.connect("pressed", self, "deleteSubNode1")

func _exit_tree():
	# When the node exits the Scene Tree, this function is called.
	# Children nodes have all exited the Scene Tree at this point
	# and all became inactive.
	print("parent _exit_tree")

func _process(delta):
	# This function is called every frame.
	pass

func _physics_process(delta):
	# This is called every physics frame.
	pass


func deleteSubNode1():
	var root = get_tree().root
	root.remove_child(self)
	
	#注意monitor监视窗口的object变化，和node变化，由于组合一个节点可能包含多个对象
	#self.queue_free()
	
	#remove_child只能移除子节点，无法移除子节点的子节点
	#get_tree().root.remove_child(self)
	#remove_child($SubNode1)
	
	#先增加再删除
	#root.add_child(self)

	#为了简单，可以使用统一的封装方法，门面模式
	#NodeUtils.removeNode(self)
