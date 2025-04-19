extends Node


@export var player_staff: Node2D
@export var player_sprite: Sprite2D
@export var animation_player: AnimationPlayer


func _process(delta: float) -> void:
	var mouse_position = get_parent().get_global_mouse_position()
	var to_mouse = mouse_position - get_parent().global_position
	player_sprite.flip_h = to_mouse.x < 0
	
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if input_dir.length_squared() > 0:
		animation_player.play("walk")
	else:
		animation_player.play("idle")
	
