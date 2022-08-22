extends Control


@export var pit_scene: PackedScene = preload("res://snake_pit.tscn")

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
	var snake_pit = pit_scene.instantiate()
#	$MC_center.visible = false
#	$MC_center.set_visible(false)
	G.reset_score()
	redraw_score_label()
	$MC_center.hide()
	$MC_top.show()
	snake_pit.set_position(Vector2(48, 96))
	add_child(snake_pit)
	snake_pit.pit_is_destroyed.connect(on_pit_is_destroyed)


func on_pit_is_destroyed():
	$MC_top.hide()
	$MC_center.show()







