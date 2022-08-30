extends Node


const STEP = 48
const TIME_STEP = 0.8 # not working
const DIRECTION_RELATIVE = 1
const DEBUG = false


var game_score = 0
var game_paused = false
var game_music = true
var game_sound = true
var smooth_move = true
var transition_type = 4
var transition_speed = 0.4


#var config = ConfigFile.new()


func _ready():
	load_config()

# Bacause setget not working

func get_score():
	return game_score


func update_score():
	game_score += 1


func reset_score():
	game_score = 0


func save_config():
	var config = ConfigFile.new()

	# Store some values.
	config.set_value("SFX", "game_music", game_music)
	config.set_value("SFX", "game_sound", game_sound)
	config.set_value("SMOOTH", "smooth_move", smooth_move)

	# Save it to a file (overwrite if already exists).
	config.save("user://snake_config.cfg")


func load_config():
	var config = ConfigFile.new()
	var load_status = config.load("user://snake_config.cfg")

# If the file didn't load, ignore it.
	if load_status == OK:
		game_music = config.get_value("SFX", "game_music")
		game_sound = config.get_value("SFX", "game_sound")
		smooth_move = config.get_value("SMOOTH", "smooth_move")
