extends Node2D


#var Snake_head = preload("res://Snake_head.gd")
@export var Snake_head: PackedScene
@export var Pit_wall: PackedScene
@export var Snake_food: PackedScene
@export var Snake_tail: PackedScene

signal pit_is_destroyed

var head = null
var tails = []

var direction = Vector2.ZERO
#var direction = Vector2(0, 0)
var target_position = Vector2.ZERO


enum MOVE {HORIZONTAL, VERTICAL}
var CURRENT_DIR = MOVE.VERTICAL
var AVAIBLE_TURN = true



# Called when the node enters the scene tree for the first time.
func _ready():
	$Time_step.set_wait_time(G.TIME_STEP)
	draw_walls()
	head = Snake_head.instantiate()
	head.set_position(Vector2(96, 96))
	add_child(head)
#	button.button_down.connect(_on_button_down)
#	This is Alfa function !!!
	head.head_collision.connect(on_head_collision)
	head.get_some_food.connect(on_get_some_food)
	drop_new_food()
	drop_new_food()
	
	direction.y = G.STEP # Temporary


func _input(event):
	if event is InputEventScreenDrag and AVAIBLE_TURN:
			$Debug_labels/Rel.set_text(str(event.get_relative()))
			match CURRENT_DIR:
				MOVE.VERTICAL:
					if event.get_relative().x > G.DIRECTION_RELATIVE:
						direction = Vector2(G.STEP, 0)
						AVAIBLE_TURN = false
						CURRENT_DIR = MOVE.HORIZONTAL
					elif event.get_relative().x < -G.DIRECTION_RELATIVE:
						direction = Vector2(-G.STEP, 0)
						AVAIBLE_TURN = false
						CURRENT_DIR = MOVE.HORIZONTAL
				MOVE.HORIZONTAL:
					if event.get_relative().y < -G.DIRECTION_RELATIVE:
						direction = Vector2(0, -G.STEP)
						AVAIBLE_TURN = false
						CURRENT_DIR = MOVE.VERTICAL
					elif event.get_relative().y > G.DIRECTION_RELATIVE:
						direction = Vector2(0, G.STEP)
						AVAIBLE_TURN = false
						CURRENT_DIR = MOVE.VERTICAL


func draw_walls():
	var wall
	# i fom 0 to 20
	for i in range(0, 13):
		wall = Pit_wall.instantiate()
		wall.set_position(Vector2(G.STEP * i, 0))
		wall.show_num(i) # For debug
		add_child(wall)
		wall = Pit_wall.instantiate()
		wall.set_position(Vector2(G.STEP * i, G.STEP * 20))
		add_child(wall)
		
	# y from 1 to 29
	for y in range(1, 20):
		wall = Pit_wall.instantiate()
		wall.set_position(Vector2(0, G.STEP * y))
		wall.show_num(y) # For debug
		add_child(wall)
		wall = Pit_wall.instantiate()
		wall.set_position(Vector2(G.STEP * 12, G.STEP * y))
		add_child(wall)



func drop_new_food():
	var food = Snake_food.instantiate()
	# get x_pos from 1 to 19 (* 32)
	var x_pos = (randi() % 11 + 1) * G.STEP
	# get y_pos from 1 to 29 (* 32)
	var y_pos = (randi() % 19 + 1) * G.STEP
	food.set_position(Vector2(x_pos, y_pos))
#	Need deffered call
#	add_child(food)
	call_deferred("add_child", food)


func add_new_tail():
	var tail = Snake_tail.instantiate()
	tail.set_position(target_position)
	call_deferred("add_child", tail)
	tails.append(tail)
	tail.show_num(tails.size())


func snake_move():
	target_position = head.get_position()
	head.set_position(head.get_position() + direction)
	for tail in tails:
		var old_position = tail.get_position()
		tail.set_position(target_position)
		target_position = old_position
	AVAIBLE_TURN = true

func on_head_collision():
	emit_signal("pit_is_destroyed")
	queue_free()


func on_get_some_food():
	add_new_tail()
	drop_new_food()


func _on_time_step_timeout():
	snake_move()











