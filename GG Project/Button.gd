extends Node2D

var pause = false

func _ready():
	pause = false

func _process(_delta):
	unpause()
		

func unpause():
	if Input.is_action_pressed("Restart"):
		print(get_tree().paused)
		StageVariables.moves = 10
		get_tree().paused = false
		print("Restart")
		

