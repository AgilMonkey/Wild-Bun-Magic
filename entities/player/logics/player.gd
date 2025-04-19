extends CharacterBody2D


signal on_player_died

@export var hurt_sound: AudioStream


func add_player_health(val: int):
	$HealthComponent.add(val)


func _on_health_component_health_reached_zero() -> void:
	on_player_died.emit()


func _on_health_component_hurted() -> void:
	SoundManager.play_sound(hurt_sound)
