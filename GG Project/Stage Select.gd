extends Control

var ssprogress = 0
#@onready var one = get_tree().get_root().get_node("/root/Control/Panel/Panel/GameplayImg")
#@onready $Control/Panel/Panel/GameplayImg2.visible = false


func _ready():
	var player_vars = get_node("/root/StageVariables")

#Change scene to main Menu screen
func _on_back_but_pressed():
	get_tree().change_scene_to_file("res://Main Menu.tscn")
	#StageVariables.moves += 1
	#print(StageVariables.moves)

#Increment ssprogress
func _on_left_but_pressed():
	if ssprogress > 0:
		ssprogress -= 1

#Lower ssprogress
func _on_right_but_pressed():
	if ssprogress < 4:
		ssprogress += 1

#Change image shown based on value of ssprogress
func _process(bool):
	match ssprogress:
		0:
			$Control2/LButHold/LeftBut.disabled = true
			$Control2/RButHold/RightBut.disabled = false
			$Control/Panel/Panel/GameplayImg.visible = true
			$Control/Panel/Panel/GameplayImg2.visible = false
			$Control/Panel/Panel/GameplayImg3.visible = false
			$Control/Panel/Panel/GameplayImg4.visible = false
			$Control/Panel/Panel/GameplayImg5.visible = false
			$Control2/TxtHold/StageTxt1.visible = true
			$Control2/TxtHold/Stage1.visible = true
			$Control2/TxtHold/StageTxt2.visible = false
			$Control2/TxtHold/Stage2.visible = false
			$Control2/TxtHold/StageTxt3.visible = false
			$Control2/TxtHold/Stage3.visible = false
			$Control2/TxtHold/StageTxt4.visible = false
			$Control2/TxtHold/Stage4.visible = false
			$Control2/TxtHold/StageTxt5.visible = false
			$Control2/TxtHold/Stage5.visible = false
		1:
			$Control2/LButHold/LeftBut.disabled = false
			$Control2/RButHold/RightBut.disabled = false
			$Control/Panel/Panel/GameplayImg.visible = false
			$Control/Panel/Panel/GameplayImg2.visible = true
			$Control/Panel/Panel/GameplayImg3.visible = false
			$Control/Panel/Panel/GameplayImg4.visible = false
			$Control/Panel/Panel/GameplayImg5.visible = false
			$Control2/TxtHold/StageTxt1.visible = false
			$Control2/TxtHold/Stage1.visible = false
			$Control2/TxtHold/StageTxt2.visible = true
			$Control2/TxtHold/Stage2.visible = true
			$Control2/TxtHold/StageTxt3.visible = false
			$Control2/TxtHold/Stage3.visible = false
			$Control2/TxtHold/StageTxt4.visible = false
			$Control2/TxtHold/Stage4.visible = false
			$Control2/TxtHold/StageTxt5.visible = false
			$Control2/TxtHold/Stage5.visible = false
		2:
			$Control2/LButHold/LeftBut.disabled = false
			$Control2/RButHold/RightBut.disabled = false
			$Control/Panel/Panel/GameplayImg.visible = false
			$Control/Panel/Panel/GameplayImg2.visible = false
			$Control/Panel/Panel/GameplayImg3.visible = true
			$Control/Panel/Panel/GameplayImg4.visible = false
			$Control/Panel/Panel/GameplayImg5.visible = false
			$Control2/TxtHold/StageTxt1.visible = false
			$Control2/TxtHold/Stage1.visible = false
			$Control2/TxtHold/StageTxt2.visible = false
			$Control2/TxtHold/Stage2.visible = false
			$Control2/TxtHold/StageTxt3.visible = true
			$Control2/TxtHold/Stage3.visible = true
			$Control2/TxtHold/StageTxt4.visible = false
			$Control2/TxtHold/Stage4.visible = false
			$Control2/TxtHold/StageTxt5.visible = false
			$Control2/TxtHold/Stage5.visible = false
		3:
			$Control2/LButHold/LeftBut.disabled = false
			$Control2/RButHold/RightBut.disabled = false
			$Control/Panel/Panel/GameplayImg.visible = false
			$Control/Panel/Panel/GameplayImg2.visible = false
			$Control/Panel/Panel/GameplayImg3.visible = false
			$Control/Panel/Panel/GameplayImg4.visible = true
			$Control/Panel/Panel/GameplayImg5.visible = false
			$Control2/TxtHold/StageTxt1.visible =false
			$Control2/TxtHold/Stage1.visible = false
			$Control2/TxtHold/StageTxt2.visible = false
			$Control2/TxtHold/Stage2.visible = false
			$Control2/TxtHold/StageTxt3.visible = false
			$Control2/TxtHold/Stage3.visible = false
			$Control2/TxtHold/StageTxt4.visible = true
			$Control2/TxtHold/Stage4.visible = true
			$Control2/TxtHold/StageTxt5.visible = false
			$Control2/TxtHold/Stage5.visible = false
		4:
			$Control2/LButHold/LeftBut.disabled = false
			$Control2/RButHold/RightBut.disabled = true
			$Control/Panel/Panel/GameplayImg.visible = false
			$Control/Panel/Panel/GameplayImg2.visible = false
			$Control/Panel/Panel/GameplayImg3.visible = false
			$Control/Panel/Panel/GameplayImg4.visible = false
			$Control/Panel/Panel/GameplayImg5.visible = true
			$Control2/TxtHold/StageTxt1.visible = false
			$Control2/TxtHold/Stage1.visible = false
			$Control2/TxtHold/StageTxt2.visible = false
			$Control2/TxtHold/Stage2.visible = false
			$Control2/TxtHold/StageTxt3.visible = false
			$Control2/TxtHold/Stage3.visible = false
			$Control2/TxtHold/StageTxt4.visible = false
			$Control2/TxtHold/Stage4.visible = false
			$Control2/TxtHold/StageTxt5.visible = true
			$Control2/TxtHold/Stage5.visible = true

#Set number of moves for selected stage and change scene
func _on_stage_1_pressed():
	StageVariables.moves = 10
	get_tree().change_scene_to_file("res://main.tscn")


func _on_stage_2_pressed():
	pass # Replace with function body.


func _on_stage_3_pressed():
	pass # Replace with function body.


func _on_stage_4_pressed():
	pass # Replace with function body.


func _on_stage_5_pressed():
	pass # Replace with function body.
