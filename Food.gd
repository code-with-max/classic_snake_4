extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var self_texture : Texture = G.get_texture("food")
	if self_texture:
		$Sprite2D.set_texture(self_texture)
		$Sprite2D.set_offset(Vector2(24, 24))
		$Sprite2D.show()
	else:
		$ColorRect.set_color(Color.DARK_OLIVE_GREEN)


