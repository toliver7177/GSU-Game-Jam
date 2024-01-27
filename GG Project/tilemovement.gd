extends Area2D
class_name Player



var isfloating = false;
var haswater = true;
var tilesize= 16
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
var floating = false

func _ready():
	position = position.snapped(Vector2.ONE * tilesize)
	position += Vector2.ONE * tilesize/2
	
func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	position += inputs[dir] * tilesize

func float():
	isfloating = true;
	print_debug("Is Floating")

func water():
	haswater = true;
