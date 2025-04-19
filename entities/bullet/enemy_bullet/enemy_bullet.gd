class_name EnemyBullet
extends Node2D


@export var damage: int = 25
var velocity: Vector2


func _physics_process(delta: float) -> void:
	position += velocity * delta


func _on_attackbox_component_on_hit(_hitbox: HitboxComponent) -> void:
	if not _hitbox.get_parent().is_in_group("player"): return
	_hitbox.damage(damage)
	queue_free()
