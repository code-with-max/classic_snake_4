extends MarginContainer



func _on_link_godot_pressed():
	OS.shell_open("https://godotengine.org")


func _on_link_git_hub_pressed():
	OS.shell_open("https://github.com/trash-max/classic_snake_4")


func _on_link_music_pressed():
	OS.shell_open("https://opengameart.org/content/we-are-prophet-happy-energetic-tune")


func _on_b_close_pressed():
	hide()


func _on_link_license_pressed():
	OS.shell_open("https://github.com/trash-max/classic_snake_4/blob/master/LICENSE.md")


func _on_link_privacy_pressed():
	OS.shell_open("https://github.com/trash-max/classic_snake_4/blob/master/PRIVACY_POLICY.md")
