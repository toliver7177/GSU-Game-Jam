extends Node2D

class_name Level1

# Called when the node enters the scene tree for the first time.
func _ready():
	StageVariables.moves = 200
	StageVariables.children_consumed = 0
	StageVariables.children = 0
	StageVariables.golden_balloons = 0
	StageVariables.score = StageVariables.moves * 1000 + StageVariables.children_consumed * 1000 * StageVariables.golden_balloons

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	pass # Replace with function body.
