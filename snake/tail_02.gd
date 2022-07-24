extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if G.DEBUG:
		$Label.show()
	$ColorRect.set_color(Color.DARK_SLATE_BLUE)


func  show_num(num):
	$Label.set_text(str(num))
