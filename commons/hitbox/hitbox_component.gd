class_name HitboxComponent
extends Area2D


@export var health: HealthComponent


func damage(value: int):
	health.damage(value)
