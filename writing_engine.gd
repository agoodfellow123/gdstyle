extends Node

static func pl(rang) -> Array: #prepare lines
	var lines = []
	for i in range(rang):
		lines.append("ln" + str(i))
	return lines

func wUrl (url, text) -> String: #write url
	return "[color=4f70ff][url=\"" + url + "\"]" + text + "[/url][/color]"

func wDL (text) -> String: #write dead link
	return "[color=575757]" + text + "[/color]"

func dUrl(urlToBeDisb) -> String: #disable url
	var regex = RegEx.new()
	regex.compile("\\].*?\\](.*).*?\\[.*?\\[")
	var res = regex.search(urlToBeDisb)
	
	if res:
		urlToBeDisb = (wDL(res.get_string(1)))
	return urlToBeDisb

func uAct(act) -> String: #user action
	var takenAction
	match act:
		"d": takenAction = "You did: "
		"u": takenAction = "You used: "
		"p": takenAction = "You picked: "
		"b": takenAction = "You bought: "
		"k": takenAction = "You killed: "
		"s": takenAction = "You said: "
		_: return "ACTION ERROR! "
		
	return wDL(takenAction)

func aAct(action, text) -> String:
	return uAct(action) + dUrl(text)
