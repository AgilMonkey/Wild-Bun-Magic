extends CharacterBody2D


func _on_health_component_health_reached_zero() -> void:
	call_deferred("queue_free")
