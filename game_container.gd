extends PanelContainer

func _on_rise_btn_pressed():
	get_node("VBoxContainer/RiseBtn").hide()
	get_node("VBoxContainer/UserUsed").text = str("User did: " + get_node("VBoxContainer/RiseBtn").text)
	get_node("VBoxContainer/RichGameOutput").bbcode_text = 'You are in an unfamiliar dark room, some of the fanatics hold torches. Why do you call them fanatics? Maybe just an instinct, or maybe the fact that they all give you that impression with their chanting around a coffin but that is insignificant right now, more importantly as you completely gain back your senses you realize something is missing... Your memories. You only remember some minor details about yourself such as [color=4f70ff][url="whatWereYou"]what were you[/url][/color]'

func _on_rich_game_output_meta_clicked(meta):
	match meta:
		"whatWereYou": get_tree().change_scene_to_file("res://CharCreator.tscn")

func _on_ready():
	var cont = $VBoxContainer
	var startGame = preload("res://start_game.gd")
	const RiseUp = preload("res://Rooms/room1/scene1.tscn")
	var RiseUpIns = RiseUp.instantiate()
	var history = get_node("VBoxContainer/History")
	if startGame.newGame == true:
		cont.add_child(RiseUpIns)
	else:
		var stats = get_node("/root/Stats")
		var nextRoom = load(stats.nextRoom())
		var nextRoomIns = nextRoom.instantiate()
		cont.add_child(nextRoomIns)
