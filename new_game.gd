extends Control

func _on_draw():
	var startGame = preload("res://start_game.gd")
	if startGame.newGame == true:
		get_node("PanelContainer/MarginContainer/HSplitContainer/InfoLineContainer").hide()
	else:
		get_node("PanelContainer/MarginContainer/HSplitContainer/InfoLineContainer").show()
		

func _on_ready():
	pass
