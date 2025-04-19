extends Area2D


@export var health_up_audio: AudioStream 
@export var health_increase: int = 25
@export var pickup_timer: float = 10.0


func _ready() -> void:
	await get_tree().create_timer(pickup_timer).timeout
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.get_parent().has_method("add_player_health"):
			body.get_parent().add_player_health(health_increase)
			SoundManager.play_sound(health_up_audio)
			queue_free()
