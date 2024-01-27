extends Control

#Change scene to How to Play screen
func _on_how_to_but_pressed():
	get_tree().change_scene_to_file("res://How To Play.tscn")

#Quit to Desktop
func _on_quit_button_2_pressed():
	get_tree().quit()

#Change scene to Stage Select screen
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Stage Select.tscn")
