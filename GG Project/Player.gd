extends Sprite2D
class_name Player

@onready var tile_map = $"../TileMap"
@onready var sprite_2d = $Sprite2D
@onready var ray_cast_2d = $RayCast2D
@onready var ray_cast_2d2 = $RayCast2D2
var is_moving = false
var is_floating = false
var has_water = false
var collision

func _process(delta):
	if is_moving:
		return
	
	if Input.is_action_pressed("up"):
		move(Vector2.UP)
	elif Input.is_action_pressed("down"):
		move(Vector2.DOWN)
	elif Input.is_action_pressed("left"):
		move(Vector2.LEFT)
	elif Input.is_action_pressed("right"):
		move(Vector2.RIGHT)
	
	

func move(direction: Vector2):
	
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
	
	var target_tile: Vector2i = Vector2i(
		current_tile.x + direction.x,
		current_tile.y + direction.y,
	)
	
	var tile_data: TileData = tile_map.get_cell_tile_data(0, target_tile)
	
	if tile_data.get_custom_data("walkable") == false:
		return
	
	ray_cast_2d.target_position = direction * 16
	ray_cast_2d.force_raycast_update()
	
	if ray_cast_2d.is_colliding():
		return
	
	ray_cast_2d2.target_position = direction * 16
	ray_cast_2d2.force_raycast_update()
	if ray_cast_2d2.is_colliding():
		var collider = ray_cast_2d2.get_collider()
		if collider is Node:
			if collider.is_in_group("wateritem"):
				wet()
			if collider.is_in_group("floatitem"):
				float()
			if collider.is_in_group("iceitem"):
				ice()
	
	is_moving = true
	global_position = tile_map.map_to_local(target_tile)
	sprite_2d.global_position = tile_map.map_to_local(current_tile)

	var tween = create_tween()
	tween.tween_property(sprite_2d, "global_position", global_position, 0.2).set_trans(Tween.TRANS_SINE)
	await tween.finished

	is_moving = false

func float():
	is_floating = true;
	print_debug("Is Floating")	
func wet():
	has_water = true;
	print_debug("Is Wet")
func ice():
	print_debug("Is Cold")
