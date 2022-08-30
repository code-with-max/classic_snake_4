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
	if G.game_sound:
		$ASP_sound.play()
	get_tree().quit()


func _on_b_settings_pressed():
	if G.game_sound:
		$ASP_sound.play()
	redraw_b_menu_state()
	$MC_options.show()


func _on_b_start_pressed():
	if G.game_sound:
		$ASP_sound.play()
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
	var start_x = %Pos2D.get_global_position().x - 312
	var start_y = %Pos2D.get_global_position().y - 480
#	snake_pit.set_position(Vector2(48, 96))
	snake_pit.set_position(Vector2(start_x, start_y))
	add_child(snake_pit)
	snake_pit.pit_need_to_destroyed.connect(on_pit_is_destroyed)
	if G.game_music:
		$ASP_music.play()


func on_pit_is_destroyed():
	if G.game_music:
		$ASP_music.stop()
	snake_pit.queue_free()
	$MC_top.hide()
	$MC_bottom/B_pause.hide()
	$MC_center.show()
	$MC_bottom/L_info.show()


func _on_b_pause_pressed():
	if G.game_sound:
		$ASP_sound.play()
	if G.game_music:
		$ASP_music.stop()
	G.game_paused = true
	snake_pit.hide()
	$MC_bottom/B_pause.hide()
	$MC_pause_menu.show()


func _on_b_resume_pressed():
	if G.game_sound:
		$ASP_sound.play()
	$MC_pause_menu.hide()
	$MC_bottom/B_pause.show()
	snake_pit.show()
#	yield(get_tree().create_timer(1), "timeout") # For Godot 3.xx
	await get_tree().create_timer(1).timeout
	G.game_paused = false
	if G.game_music:
		$ASP_music.play()


func _on_b_gomenu_pressed():
	if G.game_sound:
		$ASP_sound.play()
	$MC_pause_menu.hide()
	on_pit_is_destroyed()
#	G.game_paused = false # Use on button start


func _on_b_menu_hide_pressed():
	$MC_options.hide()
	G.save_config()


func redraw_b_menu_state():
	%B_music.set_pressed(G.game_music)
	%B_sound.set_pressed(G.game_sound)
	%B_smooth.set_pressed(G.smooth_move)


func _on_b_music_toggled(_button_pressed):
	G.game_music = %B_music.is_pressed()
	if G.game_music:
		if not $ASP_music.is_playing():
			$ASP_music.play()
	else:
		if $ASP_music.is_playing():
			$ASP_music.stop()

func _on_b_sound_toggled(_button_pressed):
	G.game_sound = %B_sound.is_pressed()


func _on_b_smooth_toggled(_button_pressed):
	G.smooth_move = %B_smooth.is_pressed()
