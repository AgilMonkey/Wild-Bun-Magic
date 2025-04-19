extends Area2D


@export var health_increase: int = 25


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method("add_player_health"):
			body.add_player_health(health_increase)
			queue_free()
