extends CharacterBody2D


signal on_player_died


func add_player_health(val: int):
	$HealthComponent.add(val)

func _on_health_component_health_reached_zero() -> void:
	on_player_died.emit()
