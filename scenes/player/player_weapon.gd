extends Node2D


var mouse_position: Vector2


func _process(delta: float) -> void:
	mouse_position = get_global_mouse_position()
	look_at(mouse_position)
