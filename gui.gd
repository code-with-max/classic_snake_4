extends Control


@export var pit_scene: PackedScene


var snake_pit

# RateMe singleton
var _rate_me_addon


# Called when the node enters the scene tree for the first time.
func _ready():
	# RateMe init, if game run on Android
	if Engine.has_singleton("GodotAndroidRateme"):
		_rate_me_addon = Engine.get_singleton("GodotAndroidRateme")
		_rate_me_addon.completed.connect(self._on_rateme_completed)
		_rate_me_addon.error.connect(self._on_rateme_error) # use err as string
	else:
		printerr("Couldn't find RateMe singleton")
	#
	
	$CR_backgroung.set_color(Color.DARK_CYAN)
	if G.DEBUG:
		print("start")
	#if _rate_me_addon:
		#_rate_me_addon.show()


func _on_rateme_error(err):
	printerr("ERROR due Rate Me: " + str(err))


func _on_rateme_completed():
	print("Rate Me completed")


# Redrawing actual status game score
func redraw_score_label():
	%L_score_data.set_text(str(G.get_score()))


# Game main menu settings
func _on_b_exit_pressed():
	# Play "click"
	if G.game_sound:
		$ASP_sound.play()
	get_tree().quit()


func _on_b_settings_pressed():
	# Play "click"
	if G.game_sound:
		$ASP_sound.play()
	redraw_b_menu_state()
	$MC_settings.show()


func _on_b_start_pressed():
	# Play "click"
	if G.game_sound:
		$ASP_sound.play()
	$MC_center.hide()
	$MC_top.show()
	$MC_bottom/B_pause.show()
	$MC_bottom/B_about.hide()
	snake_pit = pit_scene.instantiate()
	G.reset_score()
	G.game_paused = false
	redraw_score_label()
#	var start_x = %Pos2D.get_global_position().x - 312
#	var start_y = %Pos2D.get_global_position().y - 480
#	snake_pit.set_position(Vector2(start_x, start_y))
	snake_pit.set_position(Vector2(48, 120))
	add_child(snake_pit)
	snake_pit.pit_need_to_destroyed.connect(on_pit_is_destroyed)
	# Play music
	if G.game_music:
		$ASP_music.play()


func on_pit_is_destroyed():
	if G.game_music:
		$ASP_music.stop()
	snake_pit.queue_free()
	$MC_top.hide()
	$MC_bottom/B_pause.hide()
	$MC_center.show()
	$MC_bottom/B_about.show()


# Call pause menu
func _on_b_pause_pressed():
	# Play "click"
	if G.game_sound:
		$ASP_sound.play()
	# Stop music
	if G.game_music:
		$ASP_music.stop()
	G.game_paused = true
	snake_pit.hide()
	$MC_bottom/B_pause.hide()
	$MC_pause_menu.show()


# Game pause menu section
func _on_b_resume_pressed():
	# Play "click"
	if G.game_sound:
		$ASP_sound.play()
	$MC_pause_menu.hide()
	$MC_bottom/B_pause.show()
	snake_pit.show()
#	yield(get_tree().create_timer(1), "timeout") # For Godot 3.xx
	await get_tree().create_timer(1).timeout
	G.game_paused = false
	# Play music
	if G.game_music:
		$ASP_music.play()


func _on_b_gomenu_pressed():
	# Play "click"
	if G.game_sound:
		$ASP_sound.play()
	$MC_pause_menu.hide()
	on_pit_is_destroyed()


# Redrawing actual status buttons in config menu
func redraw_b_menu_state():
	%B_music.set_pressed(G.game_music)
	%B_sound.set_pressed(G.game_sound)


# Game config menu section
func _on_b_menu_hide_pressed():
	# Play "click"
	if G.game_sound:
		$ASP_sound.play()
	$MC_settings.hide()
	G.save_config()


func _on_b_music_pressed():
	# Play "click"
	if G.game_sound:
		$ASP_sound.play()
	G.game_music = %B_music.is_pressed()


func _on_b_sound_pressed():
	# Play "click"
	if G.game_sound:
		$ASP_sound.play()
	G.game_sound = %B_sound.is_pressed()


func _on_b_about_pressed():
	$MC_about_game.show()


func _on_b_rate_pressed() -> void:
	if _rate_me_addon:
		_rate_me_addon.show()
