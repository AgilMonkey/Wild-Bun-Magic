class_name SpawnManager
extends Node


const WALL_UP: int = -2160
const WALL_DOWN: int = 2160
const WALL_LEFT: int = -3959
const WALL_RIGHT: int = 3959

@export var player: CharacterBody2D
@export var enemy_to_spawn: Array[EnemyResource]

@export var spawn_start_max_count := 15

@export var spawn_count_rate := 30.0  # 1 spawn per second

@export var spawn_min_range: int = 1000  # From player
@export var spawn_max_range: int = 1200
@export var spawn_min_time: float = 0.9
@export var spawn_max_time: float = 1.8

@export var spawn_maximum_min_time: float = 0.5
@export var spawn_reduction_timer: float = 120.0
@export var spawn_time_reduction: float = 0.1


func _ready() -> void:
	start()
	
	$SpawnAddCounter.wait_time = spawn_count_rate


func start():
	var rand_time = randf_range(spawn_min_time, spawn_max_time)
	spawn_enemy()
	await get_tree().create_timer(rand_time).timeout
	start()


func _process(delta: float) -> void:
	var reduce_time_ammount = delta / spawn_reduction_timer
	spawn_min_time -= reduce_time_ammount
	spawn_max_time -= reduce_time_ammount
	spawn_min_time = max(spawn_min_time, spawn_maximum_min_time)
	spawn_max_time = max(spawn_max_time, spawn_maximum_min_time)



func spawn_enemy():
	var enemy_count = len(get_tree().get_nodes_in_group("enemy"))
	if enemy_count > spawn_start_max_count - 1:
		return
	
	var enemy_instance: Node2D = get_random_enemy().instantiate()
	enemy_instance.global_position = get_enemy_rand_position()
	get_tree().current_scene.call_deferred("add_child", enemy_instance)


func get_random_enemy() -> PackedScene:
	var total_chance = 0
	for n in enemy_to_spawn:
		total_chance += n.chance
	
	var rand_num = randi_range(0, total_chance)
	
	var cumulative = 0
	for enemy in enemy_to_spawn:
		cumulative += enemy.chance
		if rand_num <= cumulative:
			return enemy.enemy_instance
	
	return null


func get_enemy_rand_position() -> Vector2:
	var player_position = player.global_position
	var rand_vec = Vector2(5000, 5000)
	while enemy_is_over_wall(rand_vec):
		var rand_ang = randf_range(0, TAU)
		var rand_range = randi_range(spawn_min_range, spawn_max_range)
		rand_vec = Vector2.RIGHT.rotated(rand_ang).normalized() * rand_range
	return player_position + rand_vec


func enemy_is_over_wall(position: Vector2) -> bool:
	var is_over_wall = (
		position.x < WALL_LEFT or
		position.x > WALL_RIGHT or
		position.y < WALL_UP or
		position.y > WALL_DOWN
		)
	return is_over_wall


func _on_spawn_add_counter_timeout() -> void:
	spawn_start_max_count += 1
