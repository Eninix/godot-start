extends Node2D

const TimeUtils = preload("res://zfoo/scheduler/TimeUtils.gd")
const FileUtils = preload("res://zfoo/util/FileUtils.gd")


# Dictionary
var content = "hello file!!!"

# path string
var filePath: String = "user://playerData.txt"


func _ready() -> void:
	print("Original Data: ", content)
	self.loadData()
	print("Altered Data: ", content)


func saveData() -> void:
	var saveFile = File.new()
	saveFile.open(filePath, File.WRITE)
	
	print(saveFile.get_path_absolute())

	# bread and butter
	saveFile.store_line(content)
	saveFile.close()
	
	#FileUtils.writeStringToFile(filePath, content)


func loadData() -> void:
	var dataFile = File.new()
	
	# make sure our file exists on users system
	if not dataFile.file_exists(filePath):
		return # File does not exist
	
	# allow reading only for file
	dataFile.open(filePath, File.READ)
	
	content = dataFile.get_as_text()
	dataFile.close()
	#content = FileUtils.readFileToString(filePath)


# 退出的时候回调
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		content = content + TimeUtils.currentTimeMillis() as String
		self.saveData()
		get_tree().quit() # quitting the game
