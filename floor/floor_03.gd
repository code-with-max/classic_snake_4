extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.set_color(Color.DIM_GRAY)


func is_overlaps():
	if $Area2D.get_overlapping_areas().size() > 0:
		return true
	else:
		return false
