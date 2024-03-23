extends Node

var tLog
var curRoom = 0

func getRoomList() -> Array:
	var roomList = preload("res://Rooms/room1/all_rooms.gd")
	return roomList.listRooms()

func nextRoom() -> String:
	curRoom += 1
	var rL = getRoomList()[curRoom]
	return rL
