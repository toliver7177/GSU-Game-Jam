extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if %ClownWoman:
		print("hi")
		$"Area2D/Crying Sprite".hide()
		$"Area2D/Happy Sprite".show()
		$Area2D/CollisionShape2D.hide()
		StageVariables.children_cosumed += 1
