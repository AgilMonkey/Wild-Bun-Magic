extends Node2D


@export var enemy_sprite: Sprite2D

@onready var player: Node2D = get_tree().get_first_node_in_group("player")


func _process(delta: float) -> void:
	var to_player = player.global_position - global_position
	enemy_sprite.flip_h = to_player.x > 0
