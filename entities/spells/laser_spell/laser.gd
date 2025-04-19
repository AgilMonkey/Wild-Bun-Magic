class_name Laser
extends Area2D


@export var damage = 2
@export var damage_time = 0.01

var is_damaging := false
var enemies_hitbox: Array


func _process(delta: float) -> void:
	if is_damaging: return
	is_damaging = true
	#if len(enemies_hitbox) <= 0: return
	for hitbox: HitboxComponent in enemies_hitbox:
		hitbox.damage(damage)
	await get_tree().create_timer(damage_time).timeout
	is_damaging = false


func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("enemy") and area is HitboxComponent:
		enemies_hitbox.append(area)


func _on_area_exited(area: Area2D) -> void:
	enemies_hitbox.erase(area)
