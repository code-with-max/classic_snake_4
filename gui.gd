extends Control


@export var pit_scene: PackedScene = preload("res://snake_pit.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$CR_backgroung.set_color(Color.DARK_CYAN)
	print("start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_b_exit_pressed():
	get_tree().quit()


func _on_b_settings_pressed():
	pass # Replace with function body.


func _on_b_start_pressed():
	var snake_pit = pit_scene.instantiate()
#	$MC_center.visible = false
#	$MC_center.set_visible(false)
	$MC_center.hide()
	snake_pit.set_position(Vector2(48, 96))
	add_child(snake_pit)
	snake_pit.pit_is_destroyed.connect(on_pit_is_destroyed)


func on_pit_is_destroyed():
	$MC_center.show()






