extends Control

var progress = 0
#@onready var one = get_tree().get_root().get_node("/root/Control/Panel/Panel/GameplayImg")
#@onready $Control/Panel/Panel/GameplayImg2.visible = false


func _ready():
	var player_vars = get_node("/root/StageVariables")

#Change scene to main Menu screen
func _on_back_but_pressed():
	get_tree().change_scene_to_file("res://Main Menu.tscn")
	#StageVariables.moves += 1
	#print(StageVariables.moves)

#Increment progress
func _on_left_but_pressed():
	if progress > 0:
		progress -= 1

#Decrease progress
func _on_right_but_pressed():
	if progress < 4:
		progress += 1

#Change image shown based on value of progress
func _process(bool):
	match progress:
		0:
			$Control2/LButHold/LeftBut.disabled = true
			$Control2/RButHold/RightBut.disabled = false
			$Control/Panel/Panel/GameplayImg.visible = true
			$Control/Panel/Panel/GameplayImg2.visible = false
			$Control/Panel/Panel/GameplayImg3.visible = false
			$Control/Panel/Panel/GameplayImg4.visible = false
			$Control/Panel/Panel/GameplayImg5.visible = false
			$Control2/TxtHold/HelpTxt.visible = true
			$Control2/TxtHold/HelpTxt2.visible = false
			$Control2/TxtHold/HelpTxt3.visible = false
			$Control2/TxtHold/HelpTxt4.visible = false
			$Control2/TxtHold/HelpTxt5.visible = false
		1:
			$Control2/LButHold/LeftBut.disabled = false
			$Control2/RButHold/RightBut.disabled = false
			$Control/Panel/Panel/GameplayImg.visible = false
			$Control/Panel/Panel/GameplayImg2.visible = true
			$Control/Panel/Panel/GameplayImg3.visible = false
			$Control/Panel/Panel/GameplayImg4.visible = false
			$Control/Panel/Panel/GameplayImg5.visible = false
			$Control2/TxtHold/HelpTxt.visible = false
			$Control2/TxtHold/HelpTxt2.visible = true
			$Control2/TxtHold/HelpTxt3.visible = false
			$Control2/TxtHold/HelpTxt4.visible = false
			$Control2/TxtHold/HelpTxt5.visible = false
		2:
			$Control2/LButHold/LeftBut.disabled = false
			$Control2/RButHold/RightBut.disabled = false
			$Control/Panel/Panel/GameplayImg.visible = false
			$Control/Panel/Panel/GameplayImg2.visible = false
			$Control/Panel/Panel/GameplayImg3.visible = true
			$Control/Panel/Panel/GameplayImg4.visible = false
			$Control/Panel/Panel/GameplayImg5.visible = false
			$Control2/TxtHold/HelpTxt.visible = false
			$Control2/TxtHold/HelpTxt2.visible = false
			$Control2/TxtHold/HelpTxt3.visible = true
			$Control2/TxtHold/HelpTxt4.visible = false
			$Control2/TxtHold/HelpTxt5.visible = false
		3:
			$Control2/LButHold/LeftBut.disabled = false
			$Control2/RButHold/RightBut.disabled = false
			$Control/Panel/Panel/GameplayImg.visible = false
			$Control/Panel/Panel/GameplayImg2.visible = false
			$Control/Panel/Panel/GameplayImg3.visible = false
			$Control/Panel/Panel/GameplayImg4.visible = true
			$Control/Panel/Panel/GameplayImg5.visible = false
			$Control2/TxtHold/HelpTxt.visible = false
			$Control2/TxtHold/HelpTxt2.visible = false
			$Control2/TxtHold/HelpTxt3.visible = false
			$Control2/TxtHold/HelpTxt4.visible = true
			$Control2/TxtHold/HelpTxt5.visible = false
		4:
			$Control2/LButHold/LeftBut.disabled = false
			$Control2/RButHold/RightBut.disabled = true
			$Control/Panel/Panel/GameplayImg.visible = false
			$Control/Panel/Panel/GameplayImg2.visible = false
			$Control/Panel/Panel/GameplayImg3.visible = false
			$Control/Panel/Panel/GameplayImg4.visible = false
			$Control/Panel/Panel/GameplayImg5.visible = true
			$Control2/TxtHold/HelpTxt.visible = false
			$Control2/TxtHold/HelpTxt2.visible = false
			$Control2/TxtHold/HelpTxt3.visible = false
			$Control2/TxtHold/HelpTxt4.visible = false
			$Control2/TxtHold/HelpTxt5.visible = true
