extends Node


@export var health: HealthComponent


func _ready() -> void:
	GlobalUi.player_health = health
