extends RichTextLabel

var ln
func _on_ready():
	var wEng = get_node("/root/WritingEngine")
	ln = wEng.pl(3)
	
	var stats = get_node("/root/Stats")
	
	ln[0] = "The game has started, and this is a new scene."
	ln[1] = wEng.wUrl("op1","Option1")
	ln[2] = wEng.wUrl("op2", "Option2")
	if stats.tLog == null:
		pass
	else:
		self.bbcode_text = stats.tLog + ln[0] + "\n\n" + ln[1] + "\n" + ln[2]

func _on_meta_clicked(meta):
	var wEng = get_node("/root/WritingEngine")
	var stats = get_node("/root/Stats")
	match meta:
		"op1": self.bbcode_text = stats.tLog + ln[0] + "\n\n" + wEng.dUrl(ln[1]) + "\n" + wEng.dUrl(ln[2]) + "\n\nOption1 selected"
		"op2": self.bbcode_text = stats.tLog + ln[0] + "\n\n" + wEng.dUrl(ln[1]) + "\n" + wEng.dUrl(ln[2]) + "\n\nOption2 selected"
