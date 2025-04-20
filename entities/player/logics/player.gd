extends CharacterBody2D


signal on_player_died

@export var hurt_sound: AudioStream
var hurt_sound_stream_cur: AudioStreamPlayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player_animation: Node = $PlayerAnimation


func add_player_health(val: int):
	$HealthComponent.add(val)


func _on_health_component_health_reached_zero() -> void:
	await player_animation.player_death()
	process_mode = Node.PROCESS_MODE_DISABLED
	on_player_died.emit()


func _on_health_component_hurted() -> void:
	SoundManager.stop_sound(hurt_sound)
	SoundManager.play_sound(hurt_sound)
