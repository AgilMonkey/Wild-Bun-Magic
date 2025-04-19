class_name SpawnManager
extends Node


@export var player: CharacterBody2D
@export var enemy_instance: PackedScene
@export var spawn_min_range: int = 750  # From player
@export var spawn_max_range: int = 1200
@export var spawn_min_time: float = 0.9
@export var spawn_max_time: float = 1.8


func _ready() -> void:
	pass # WARNING DELETE ME LATER PLEASE
	start()


func start():
	var rand_time = randf_range(spawn_min_time, spawn_max_time)
	spawn_enemy()
	await get_tree().create_timer(rand_time).timeout
	start()


func spawn_enemy():
	var enemy_instance: Node2D = enemy_instance.instantiate()
	enemy_instance.global_position = get_enemy_rand_position()
	get_tree().current_scene.call_deferred("add_child", enemy_instance)


func get_enemy_rand_position() -> Vector2:
	var player_position = player.global_position
	var rand_ang = randf_range(0, TAU)
	var rand_range = randi_range(spawn_min_range, spawn_max_range)
	var rand_vec = Vector2.RIGHT.rotated(rand_ang).normalized() * rand_range
	return player_position + rand_vec
