extends CharacterBody2D


const ENEMY_HIT_SOUND = preload("res://assets/enemy_hit.wav")

@export var health_pickup_instance: PackedScene
@export var chance_to_drop_health = 0.25
@export var nodes_to_dissable: Array[Node]

@onready var enemy_anim_player: AnimationPlayer = $EnemyAnimPlayer
@onready var follow_player: Node = $FollowPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var hitbox_component: HitboxComponent = $HitboxComponent

func _on_health_component_health_reached_zero() -> void:
	drop_pickups()
	Global.player_killed_an_enemy.emit()
	
	follow_player.process_mode = Node.PROCESS_MODE_DISABLED
	collision_shape_2d.call_deferred("set_disabled", true)
	hitbox_component.call_deferred("queue_free")
	for node: Node in nodes_to_dissable:
		node.queue_free()
	SoundManager.play_sound(ENEMY_HIT_SOUND)
	enemy_anim_player.play("enemy_anim_lib/death")


func drop_pickups():
	if randf_range(0.00, 1.00) < chance_to_drop_health:
		drop_health()


func drop_health():
	var health: Node2D = health_pickup_instance.instantiate()
	health.global_position = global_position
	get_tree().current_scene.call_deferred("add_child", health)
