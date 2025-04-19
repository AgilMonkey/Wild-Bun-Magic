extends Node


@export var player_staff: Node2D
@export var player_sprite: Sprite2D


func _process(delta: float) -> void:
	var mouse_position = get_parent().get_global_mouse_position()
	var to_mouse = mouse_position - get_parent().global_position
	player_sprite.flip_h = to_mouse.x < 0
