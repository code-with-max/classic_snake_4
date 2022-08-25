extends Control


@export var pit_scene: PackedScene = preload("res://snake_pit.tscn")


var snake_pit


# Called when the node enters the scene tree for the first time.
func _ready():
	$CR_backgroung.set_color(Color.DARK_CYAN)
	if G.DEBUG:
		print("start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func redraw_score_label():
	%L_score_data.set_text(str(G.get_score()))


func _on_b_exit_pressed():
	get_tree().quit()


func _on_b_settings_pressed():
	pass # Replace with function body.


func _on_b_start_pressed():
	snake_pit = pit_scene.instantiate()
#	$MC_center.visible = false
#	$MC_center.set_visible(false)
	G.reset_score()
	G.game_paused = false
	redraw_score_label()
	$MC_center.hide()
	$MC_bottom/L_info.hide()
	$MC_top.show()
	$MC_bottom/B_pause.show()
	snake_pit.set_position(Vector2(48, 96))
	add_child(snake_pit)
	snake_pit.pit_need_to_destroyed.connect(on_pit_is_destroyed)


func on_pit_is_destroyed():
	snake_pit.queue_free()
	$MC_top.hide()
	$MC_bottom/B_pause.hide()
	$MC_center.show()
	$MC_bottom/L_info.show()


func _on_b_pause_pressed():
	G.game_paused = true
	snake_pit.hide()
	$MC_pause_menu.show()


func _on_b_resume_pressed():
	$MC_pause_menu.hide()
	snake_pit.show()
#	yield(get_tree().create_timer(1), "timeout") # For Godot 3.xx
	await get_tree().create_timer(1).timeout
	G.game_paused = false


func _on_b_gomenu_pressed():
	$MC_pause_menu.hide()
	on_pit_is_destroyed()
#	G.game_paused = false # Use on button start
	
	
	
	
	
	
