extends CharacterBody2D


@export var health_pickup_instance: PackedScene
@export var chance_to_drop_health = 0.25

@onready var enemy_anim_player: AnimationPlayer = $EnemyAnimPlayer
@onready var follow_player: Node = $FollowPlayer


func _on_health_component_health_reached_zero() -> void:
	drop_pickups()
	Global.player_killed_an_enemy.emit()
	
	follow_player.process_mode = Node.PROCESS_MODE_DISABLED
	enemy_anim_player.play("enemy_anim_lib/death")


func drop_pickups():
	if randf_range(0.0, 1.0) < chance_to_drop_health:
		drop_health()


func drop_health():
	var health: Node2D = health_pickup_instance.instantiate()
	health.global_position = global_position
	get_tree().current_scene.call_deferred("add_child", health)
