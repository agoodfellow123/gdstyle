extends RichTextLabel

var ln

func _on_ready():
	var wEng = get_node("/root/WritingEngine")
	ln = wEng.pl(5)
	ln[0] = "intro text."
	ln[1] = wEng.wUrl("cont", "continue")
	ln[2] = 'these are all continous bbtexts with bbtext links instead of buttons '
	ln[3] = wEng.wUrl("sgam","start game")
	ln[4] = '.'
	self.bbcode_text = ln[0] + "\n" + ln[1]

func _on_meta_clicked(meta):
	var wEng = get_node("/root/WritingEngine")
	
	var stats = get_node("/root/Stats")
	stats.tLog = ln[0] + "\n" + wEng.aAct("d", ln[1]) + "\n\n" + ln[2] + wEng.dUrl(ln[3]) + ln[4] + "\n\n"
	
	match meta:
		"cont": 
			self.bbcode_text = ln[0] + "\n" + wEng.aAct("d", ln[1]) + "\n\n" + ln[2] + ln[3]
		"sgam": 
			var startGame = preload("res://start_game.gd")
			startGame.newGame = false
			get_tree().change_scene_to_file("res://Game.tscn")
