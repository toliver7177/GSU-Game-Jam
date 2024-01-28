extends Button

func gameover():
	if StageVariables.moves <= 0:
		print("Loser")
		get_tree().paused = true
		
func unpause():
	if Input.is_action_pressed("Restart"):
		StageVariables.moves = 10
		print("Restart")
		get_tree().paused = false

