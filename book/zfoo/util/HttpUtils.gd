extends Object

const TimeUtils = preload("res://zfoo/scheduler/TimeUtils.gd")
const StringUtils = preload("res://zfoo/util/StringUtils.gd")

const REQUEST_TIMEOUT = 30 * TimeUtils.MILLIS_PER_SECOND



const HEADERS = [
	"User-Agent: Pirulo/1.0 (Godot)",
	"Accept: */*"
]

const CONTENT_BYTESTREAM = "Content-Type: bytestream"
const CONTENT_JSON = "Content-Type: application/json"
const CONTENT_TEXT = "Content-Type: text/plain"

var ERR_BODY = "Parse Error unsupported body"
var ERR_CONN = "Connection error, can't reach host"
var ERR_REQUEST = "Request failed, invalid params?"

#func _init():
	# Init SSL Certificates - Is broken in master
	# Add manually in Menu Project->Network->ssl
	# ProjectSettings.set("network/ssl/certificates", get_script().get_path().get_base_dir()+"/ca-certificates.crt")
	
func error(code):
	var rs = {}
	
	rs["header"] = {}
	rs["body"] = str(code)
	rs["code"] = 404
	
	print(rs)
	
	return rs


var HTTP = "http://"
var HTTPS = "https://"

func req(verb, address, body):	
	if StringUtils.isEmpty(address):
		return error("Invalid http request, adress is empty")
		
	var headerBody = toHeaderAndBody(body)
	var headers = headerBody[0]
	body = headerBody[1]
	
	var uri_dict = get_link_address_port_path(address)
	
	var serverAdress = uri_dict["host"]
	var port = uri_dict["port"]
	var path = uri_dict["path"]
	var fullhost = uri_dict["fullhost"]
	
	var ssl = uri_dict["ssl"]
	
	var _http = HTTPClient.new()
	_http.set_blocking_mode( true ) #wait until all data is available on response
	
	var err = _http.connect_to_host(serverAdress, port, ssl)
	assert(err == OK) # Make sure connection is OK.
	var start_time_in_ms = OS.get_ticks_msec()
	while (_http.get_status()==HTTPClient.STATUS_CONNECTING) || (_http.get_status()==HTTPClient.STATUS_RESOLVING):
			_http.poll()
			print("Connecting...")
			if ((OS.get_ticks_msec() - start_time_in_ms) >= REQUEST_TIMEOUT): # TIMEOUT
				printerr(ERR_TIMEOUT)
				return

			if !OS.has_feature("web"):
				OS.delay_msec(500)
			else:
				yield(Engine.get_main_loop(), "idle_frame")
	
	var http_fullhost = checkServerConnection(address)
	
	if(TYPE_INT != typeof(_http) && _http.get_status()==HTTPClient.STATUS_CONNECTED):
		err = _http.request_raw(verb, path, headers, body)
		
		if(!err):
			return getResponse(_http)
		else:
			return error(ERR_REQUEST)
	return error(ERR_CONN)

#var http # sync can only have one / blocks
# TODO all requests should be async
# 1. The ui will block and multiple sync http connections are not possbile anyway
# 2. The multiple http connections are useless, and returning the http connection to close it is not possible
func get(adress):
	return req(HTTPClient.METHOD_GET, adress, PoolByteArray())

func put(adress, body=PoolByteArray([])):
	return req(HTTPClient.METHOD_PUT, adress, body)

func post(adress, body=PoolByteArray([])):
	return req(HTTPClient.METHOD_POST, adress, body)

func delete(adress):
	return req(HTTPClient.METHOD_DELETE, adress, PoolByteArray())

func thread(verb, adress, function, body1):
	var thread = Thread.new()
	var args = [verb, adress, body1, function, thread]
	thread.start(self, "reqAsync", args)
	return thread

var requests = {}
func stop_async(thread):
	if(requests.has(thread)):
		requests[thread].close()

func reqAsync(args):
	var verb = args[0]
	var adress = args[1]
	var body1 = args[2]
	var function = args[3]
	var thread = args[4]
	
	function.call_func(req( verb, adress, body1))
	requests.erase(thread)

func getAsync(adress, function):
	return thread(HTTPClient.METHOD_GET, adress, function, PoolByteArray())
	
func putAsync(adress, function, body=PoolByteArray([])):
	return thread(HTTPClient.METHOD_PUT, adress, function, body)
	
func postAsync(adress, function, body=PoolByteArray([])):
	return thread(HTTPClient.METHOD_POST, adress, function, body)
	
func deleteAsync(adress, function):
	return thread(HTTPClient.METHOD_DELETE, adress, function, PoolByteArray())

func toHeaderAndBody(body):
	var headers = Array(HEADERS)
	
	var type = typeof(body)
	if (type == TYPE_RAW_ARRAY):
		if (body.size()>0):
			headers.append(CONTENT_BYTESTREAM)
	elif (type == TYPE_DICTIONARY):
		if (!body.empty()):
			headers.append(CONTENT_JSON)
			body = to_json(body).to_utf8()
	elif (type == TYPE_STRING):
		if (body.length()>0):
			headers.append(CONTENT_TEXT)
			body = body.to_utf8()
	
	return [headers,body]

func get_link_address_port_path(uri):
	var left = ""
	var link = ""
	var ssl = false
	
	if(uri.begins_with(HTTPS)):
		ssl = true
		link = uri.replace(HTTPS, "")
		left+=HTTPS
	else:
		link = uri.replace(HTTP, "")
		left+=HTTP
		
	var hostport = link.split("/", true)[0]
	
	left+=hostport
	
	var host_port = hostport.split(":", true)
	var host = host_port[0]
		
	var port = "80"
	if(host_port.size()>1):
		port = host_port[1]
	if(uri.begins_with(HTTPS)):# check if https -> ssl/tls 443
		port = "443"

	var path = uri.replace(left,"")
	if (StringUtils.isEmpty(path)):
		path = "/"
	
	return {
			"uri":uri, 
			"host":host,
			"port":int(port),
			"path":path,
			"ssl":ssl,
			"fullhost":hostport
		}

func checkServerConnection(adress):

	var uri_dict = get_link_address_port_path(adress)
	
	var serverAdress = uri_dict["host"]
	var port = uri_dict["port"]
	var path = uri_dict["path"]
	var fullhost = uri_dict["fullhost"]
	
	var ssl = uri_dict["ssl"]
	
	var _http = HTTPClient.new()
	_http.set_blocking_mode( true ) #wait until all data is available on response
	
	var err = _http.connect_to_host(serverAdress, port, ssl)
	
	if(!err):
		var start_time_in_ms = OS.get_ticks_msec()
		while( (_http.get_status()==HTTPClient.STATUS_CONNECTING or
				_http.get_status()==HTTPClient.STATUS_RESOLVING) &&
				(OS.get_ticks_msec()-start_time_in_ms)<REQUEST_TIMEOUT):
			_http.poll()

		if((OS.get_ticks_msec()-start_time_in_ms)>=REQUEST_TIMEOUT): # TIMEOUT
			return [HTTPClient.STATUS_CANT_CONNECT, fullhost]
		else:
			return [_http, fullhost, path]
	else:
		return [HTTPClient.STATUS_CANT_CONNECT, fullhost]

func getResponse(_http):
	
	var rs = {}
	
	rs["header"] = {}
	rs["body"] = ""
	rs["code"] = 404
	
	# Keep polling until the request is going on - in some cases the server will not respond I will add a timeout
	var start_time_in_ms = OS.get_ticks_msec()
	while ((_http.get_status() != HTTPClient.STATUS_DISCONNECTED) && 
		(_http.get_status() == HTTPClient.STATUS_REQUESTING) &&
		((OS.get_ticks_msec()-start_time_in_ms)<REQUEST_TIMEOUT)):
		_http.poll()
	
	if(_http.get_status() == HTTPClient.STATUS_DISCONNECTED):
		return error("HTTP DC")
	
	if((OS.get_ticks_msec()-start_time_in_ms)>=REQUEST_TIMEOUT):
		return error("TIMEOUT")
	
	rs["code"] = _http.get_response_code()

	if (_http.has_response()):
		# Get response headers
		var headers = _http.get_response_headers_as_dictionary()
		
		for key in headers:
			rs["header"][key.to_lower()] = headers[key]
		
		# var cache = headers
		
		var rb = PoolByteArray() #array that will hold the data
		
		while(_http.get_status()==HTTPClient.STATUS_BODY):
			#_http.set_read_chunk_size( _http.get_response_body_length() )
			rb += _http.read_response_body_chunk()
		
		if("content-length" in rs["header"] && rs["header"]["content-length"]!="0"):
			rs["body"] = parse_body_to_var(rb, rs["header"]["content-type"])
		else:
			rs["body"] = ""
		
		return rs
	else:
		if _http.get_status()==HTTPClient.STATUS_CONNECTION_ERROR:
			print("Maybe Certificates no set in project_settings/network/ssl/")
			breakpoint
		return rs

func parse_body_to_var(body, content_type):
	if(content_type.find("application/json")!=-1):
		body = body.get_string_from_utf8()
		#print(body)
		var bodyDict = parse_json( body )
		#print(bodyDict)
		if( typeof(bodyDict) == TYPE_DICTIONARY):
			body = bodyDict
		elif( typeof(bodyDict) == TYPE_ARRAY):
			body = bodyDict
		elif(body=="null"):
			body = {}
		else:
			print("Error body incompatible content_type: " + str(typeof(bodyDict)))
		
	elif(content_type.find("text/plain")!=-1||content_type.find("text/html")!=-1):
		body = body.get_string_from_utf8()
	elif(content_type.find("bytestream")!=-1):
		pass #return body
	return body
