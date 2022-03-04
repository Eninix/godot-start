extends Object

const StringUtils = preload("res://zfoo/util/StringUtils.gd")

# 移除node节点
static func removeNode(node: Node) -> void:
	if (node == null):
		return
	var parent = node.get_parent()
	if (parent == null):
		node.queue_free()
		return
	parent.remove_child(node)
	node.queue_free()
	


# 实例化场景，并将场景添加到node中
static func addScene(node: Node, scene: PackedScene) -> Node:
	var sceneNode = scene.instance()
	node.add_child(sceneNode)
	return sceneNode

# 转换场景
static func changeScene(sceneTree: SceneTree, scenePath: String) -> void:
	var error = sceneTree.change_scene(scenePath)
	if error == OK:
		pass
	printerr(StringUtils.format("SceneTree[{}]加载场景[scenePath:{}]异常[{}]", [sceneTree, scenePath, error]))

	
static func changeSceneTo(sceneTree: SceneTree, scene: PackedScene) -> void:
	var error = sceneTree.change_scene_to(scene)
	if error == OK:
		pass
	printerr(StringUtils.format("SceneTree[{}]加载场景[scene:{}]异常[{}]", [sceneTree, scene, error]))
