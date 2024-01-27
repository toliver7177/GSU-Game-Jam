extends Area2D



func _on_wateritem_area_entered(area):
	if area is Player:
		print_debug("EXPLODE")
