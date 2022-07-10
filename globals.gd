extends Node


const STEP = 48
const TIME_STEP = 0.8
const DIRECTION_RELATIVE = 3


var head_texture : Texture = preload("res://sprites/sprites_v01/head.png")

var tail_texture = [
	preload("res://sprites/sprites_v01/tail_01.png"),
	preload("res://sprites/sprites_v01/tail_02.png"),
	preload("res://sprites/sprites_v01/tail_03.png"),
]

var wall_texture = [
	preload("res://sprites/sprites_v01/wall_01.png"),
	preload("res://sprites/sprites_v01/wall_02.png"),
	preload("res://sprites/sprites_v01/wall_03.png"),
]

var food_texture = [
	preload("res://sprites/sprites_v01/aplle_01.png"),
	preload("res://sprites/sprites_v01/aplle_02.png"),
]

var floor_texture = [
	preload("res://sprites/sprites_v01/floor_01.png"),
	preload("res://sprites/sprites_v01/floor_02.png"),
	preload("res://sprites/sprites_v01/floor_03.png"),
] 


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func get_texture(asked_texture):
	var texture_to_set = null
	match asked_texture:
		"wall":
			texture_to_set = wall_texture
		"tail":
			texture_to_set = tail_texture
		"food":
			texture_to_set = food_texture
		"floor":
			texture_to_set = floor_texture
	if texture_to_set:
		texture_to_set.shuffle()
		return texture_to_set[0]
	else:
		return null
	


# Old version
func get_wall_texture():
	if wall_texture:
		wall_texture.shuffle()
		return wall_texture[0]
	else:
		return null
