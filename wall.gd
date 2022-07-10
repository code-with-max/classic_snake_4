extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var self_texture : Texture = G.get_texture("wall")
	if self_texture:
		$Sprite2D.set_texture(self_texture)
		$Sprite2D.set_offset(Vector2(24, 24))
		$Sprite2D.show()
	else:
		$ColorRect.set_color(Color.MEDIUM_PURPLE)
		$ColorRect.show()


# For debug
func show_num(num):
	$Label_num.set_text(str(num))


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
