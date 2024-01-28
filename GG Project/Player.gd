extends Sprite2D
class_name Player

@onready var tile_map = $"../TileMap"
@onready var sprite_2d = $Sprite2D
@onready var ray_cast_2d = $MoveCast
@onready var ray_cast_2d2 = $ObjCast
@onready var _animation_player = $Ms_Clown/Marker2D/AnimationPlayer
@onready var _clownsprite = $Ms_Clown/ClownGirl
var is_moving = false
var is_floating = false
var is_wet = false
var is_cold = false
var is_gameover = false
var collision


func _process(_delta):
	if is_moving || is_gameover:
		return
	_animation_player.speed_scale = 2
	if Input.is_action_pressed("up"):
		_animation_player.play("LeftMove")
		move(Vector2.UP)
		
	elif Input.is_action_pressed("down"):
		_animation_player.play("LeftMove")
		_animation_player.advance(0)
		move(Vector2.DOWN)
		
		
	elif Input.is_action_pressed("left"):
		_animation_player.play("LeftMove")
		_animation_player.advance(0)
		move(Vector2.LEFT)
		
		
	elif Input.is_action_pressed("right"):
		_animation_player.play("LeftMove")
		move(Vector2.RIGHT)
		_animation_player.advance(0)
		
	if _animation_player.current_animation != "Idle" && _animation_player.current_animation != "LeftMove":
		
		_animation_player.play("Idle")
		
		
	gameover()
	#print("tick")
	#unpause()
	#move_lbl.text = str(StageVariables.moves)
	
func _ready():
	
	is_moving = false
	is_floating = false
	is_wet = false
	is_cold = false
	var _Player_vars = get_node("/root/StageVariables")
	
	
	
	var freeze = get_node("/root/ColdSteps")
	var hover = get_node("/root/Flying")
	var cooling = get_node("/root/Soak")
	#move_lbl.text = str(StageVariables.moves)
	
	
func move(direction: Vector2):
	
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
	
	var target_tile: Vector2i = Vector2i(
		current_tile.x + direction.x,
		current_tile.y + direction.y,
	)
	
	var tile_data: TileData = tile_map.get_cell_tile_data(0, target_tile)
	
	#move_lbl.text = str(StageVariables.moves - 1)
	if tile_data.get_custom_data("walkable") == false:
		return
	# Check if the player is cold and can walk on water tiles
	if tile_data.get_custom_data("water") == true && is_cold == false:
		return
	if tile_data.get_custom_data("hole") == true && is_floating == false:
		return
	if tile_data.get_custom_data("fire") == true && is_wet == false:
		return
	if tile_data.get_custom_data("lava") == true && is_wet == false:
		return
	
	
	if tile_data.get_custom_data("water") == true && is_cold == true:
		tile_map.set_cell(0,Vector2i(target_tile.x,target_tile.y),0,Vector2i(2,5))
		ColdSteps.cold_steps -= 1
		print (ColdSteps.cold_steps)
		
	if tile_data.get_custom_data("fire") == true && is_wet == true:
		tile_map.set_cell(0,Vector2i(target_tile.x,target_tile.y),0,Vector2i(0,4))
	
	if tile_data.get_custom_data("lava") == true && is_wet == true:
		tile_map.set_cell(0,Vector2i(target_tile.x,target_tile.y),0,Vector2i(0,1))
		Soak.lava_steps -= 1
		print (Soak.lava_steps)
	
	if tile_data.get_custom_data("cool") == true:
		tile_map.set_cell(0,Vector2i(target_tile.x,target_tile.y),0,Vector2i(8,2))
	
	if tile_data.get_custom_data("hole") == true && is_floating == true:
		Flying.fly -= 1
		print (Flying.fly)
		
	if tile_data.get_custom_data("spike") == true:
		StageVariables.moves -= 1 #Calls to StageVariables global and updates current moves
		print(StageVariables.moves) #For Debugging prints stage variables
		clear()
		
	if tile_data.get_custom_data("clear") == true:
		clear()
	
	if ColdSteps.cold_steps <= 0:
		is_cold = false	
		print_debug("No longer cold")
	
	if Flying.fly <= 0:
		is_floating = false	
		print_debug("You're Grounded")
	
	if Soak.lava_steps <= 0:
		is_wet = false	
		print_debug("Ow")
	
	ray_cast_2d.target_position = direction * 16
	ray_cast_2d.force_raycast_update()
	
	if ray_cast_2d.is_colliding():
		return
	
	ray_cast_2d2.target_position = direction * 16
	ray_cast_2d2.force_raycast_update()
	if ray_cast_2d2.is_colliding(): #Check current item/terrain player is looking at
		var collider = ray_cast_2d2.get_collider()
		if collider is Node:
			#Item Check Logic
			if collider.is_in_group("water_item"): 
				wet()
				
			if collider.is_in_group("float_item"):
				fly()
				
			if collider.is_in_group("iceitem"):
				ice()
			
			#Terrain Check Logic
			if collider.is_in_group("hole") && is_floating == false:
				return
				
			if collider.is_in_group("hole") && is_floating == true:
				yeah()
				print("Hole")
				
			if collider.is_in_group("water") && is_cold == false:
				return
				
			if collider.is_in_group("water") && is_cold == true:
				yeah()
				print("Water")
				
	is_moving = true
	
	global_position = tile_map.map_to_local(target_tile)
	sprite_2d.global_position = tile_map.map_to_local(current_tile)
	StageVariables.moves -= 1 #Calls to StageVariables global and updates current moves
	print(StageVariables.moves) #For Debugging prints stage variables
	
	
	
	var tween = create_tween()
	tween.tween_property(sprite_2d, "global_position", global_position, 0.2).set_trans(Tween.TRANS_SINE)
	await tween.finished

	is_moving = false


func fly(): #Function that activates the floatitem effect
	is_floating = true
	Flying.fly = 5
	print_debug("Is Float")
func wet(): #Function that activates the floatitem effect
	is_wet = true
	print_debug("Is Wet")
func ice(): #Function that activates the floatitem effect
	is_cold = true
	ColdSteps.cold_steps = 5
	print_debug("Is Cold")

func clear(): #Function that removes all item effects
	is_floating = false;
	is_wet = false;
	is_cold = false;

func yeah(): #Allows the player to go over terrain, it works, its just kind of jank
	print_debug("Item Active")
	
func gameover():
	if StageVariables.moves <= 0:
		print("Loser")
		is_gameover = true
		set_process_unhandled_input(false)
		
#func unpause():
#	if Input.is_action_pressed("Restart"):
#		StageVariables.moves = 10
#		print("Restart")
#		get_tree().paused = false
		
		
