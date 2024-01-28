extends Node2D

@onready var man = $MainCam/UIImg/MovCount
@onready var man2 = $MainCam/UIImg/MovCount2
#var red = Color(1.0,0.0,0.0,1.0)
# Called when the node enters the scene tree for the first time.
func _ready():
	man.text = str(StageVariables.moves)
	man2.text = str(StageVariables.moves)
	$MainCam/UIImg/MovCount2.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	man.text = str(StageVariables.moves)
	man2.text = str(StageVariables.moves)
	if StageVariables.moves <= 9:
		#man.disabled = true
		#man2.disabled = false
		$MainCam/UIImg/MovCount.hide()
		$MainCam/UIImg/MovCount2.show()
