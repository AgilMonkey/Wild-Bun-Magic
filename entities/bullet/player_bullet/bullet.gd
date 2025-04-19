class_name Bullet
extends Node2D


@export var damage: int = 25
var velocity: Vector2


func _ready() -> void:
	await get_tree().create_timer(20.0).timeout
	call_deferred("queue_free")


func _physics_process(delta: float) -> void:
	position += velocity * delta


func _on_attackbox_component_on_hit(_hitbox: HitboxComponent) -> void:
	if _hitbox.get_parent().is_in_group("player"): return
	_hitbox.damage(damage)
	queue_free()
