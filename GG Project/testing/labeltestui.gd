extends Node2D

@onready var man = $MainCam/UIImg/MovCount
# Called when the node enters the scene tree for the first time.
func _ready():
	man.text = str(StageVariables.moves)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	man.text = str(StageVariables.moves)
