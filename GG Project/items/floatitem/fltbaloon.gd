extends Node2D

func _on_fltballon_area_entered(area):
	if area is Player:
		area.isfloating = true
		print_debug(area.isfloating)
		queue_free()
