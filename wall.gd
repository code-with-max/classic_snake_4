extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.set_color(Color.MEDIUM_PURPLE)


# For debug
func show_num(num):
	$Label_num.set_text(str(num))


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
