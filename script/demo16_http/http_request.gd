extends HTTPRequest


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	httpRequest()
	pass

func httpRequest():
	var headers: PoolStringArray = []
	self.set_use_threads(true)
	self.connect("request_completed", self, "doSomething")
	self.request("https://www.baidu.com/")
		

func doSomething(result, response_code, headers, body: PoolByteArray):
	
	if(response_code == 200):
		var data = body.get_string_from_utf8()
		print(data)
	else:
		print('response_code: ', response_code)
		print('problem on the server')
