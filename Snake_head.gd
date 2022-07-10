extends Node2D


signal head_collision
signal get_some_food

# Called when the node enters the scene tree for the first time.
func _ready():
	if G.head_texture:
		$Sprite2D.set_texture(G.head_texture)
		$Sprite2D.set_position(Vector2(24, 24))
		$Sprite2D.set_scale(Vector2(0.32, 0.32))
#		$Sprite2D.set_visible(true)
		$Sprite2D.show()
	else: 
#		$ColorRect.color = Color.ROYAL_BLUE
		$ColorRect.set_color(Color.ROYAL_BLUE)
		$ColorRect.show()



func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("obstacles"):
		print("collision with obstacles")
#		get_parent().on_snake_collision()
		emit_signal("head_collision")
		
	if area.get_parent().is_in_group("food"):
		area.get_parent().queue_free()
		print("get some food")
		emit_signal("get_some_food")
