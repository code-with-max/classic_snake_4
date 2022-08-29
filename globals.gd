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


func get_score():
	return game_score


func update_score():
	game_score += 1


func reset_score():
	game_score = 0
