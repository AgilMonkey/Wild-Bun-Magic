extends CharacterBody2D


@export var health_pickup_instance: PackedScene
@export var chance_to_drop_health = 0.25


func _on_health_component_health_reached_zero() -> void:
	drop_pickups()
	call_deferred("queue_free")


func drop_pickups():
	if randf_range(0.0, 1.0) < chance_to_drop_health:
		drop_health()


func drop_health():
	var health: Node2D = health_pickup_instance.instantiate()
	health.global_position = global_position
	get_tree().root.add_child(health)
