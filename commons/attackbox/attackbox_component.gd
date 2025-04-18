class_name AttackboxComponent
extends Area2D


@export var damage := 25


func _on_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		area.damage(damage)
