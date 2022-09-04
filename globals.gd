extends Node


const STEP = 48
const TIME_STEP = 0.8 # not working
const DIRECTION_RELATIVE = 3
const DEBUG = false


var game_score = 0
var game_paused = false
var game_music = true
var game_sound = true


# Bacause setget not working

func _ready():
	load_config()


func get_score():
	return game_score


func update_score():
	game_score += 1


func reset_score():
	game_score = 0


func save_config():
	var config = ConfigFile.new()
	config.set_value("SFX", "game_sound", game_sound)
	config.set_value("SFX", "game_music", game_music)
	config.save("user://snake_config.cfg")


func load_config():
	var config = ConfigFile.new()
	
	var load_status = config.load("user://snake_config.cfg")
	if load_status == OK:
		game_music = config.get_value("SFX", "game_music")
		game_sound = config.get_value("SFX", "game_sound")
	
	
	
	
	
	








