class_name Bullet
extends Node2D


var velocity: Vector2


func _physics_process(delta: float) -> void:
	position += velocity * delta


func _on_attackbox_component_on_hit(_hitbox: HitboxComponent) -> void:
	queue_free()
