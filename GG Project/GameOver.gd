extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_retry_but_pressed():
	get_tree().reload_current_scene()


func _on_main_menu_but_pressed():
	get_tree().change_scene_to_file("res://Main Menu.tscn")
