class_name AttackboxComponent
extends Area2D


signal on_hit(hitbox: HitboxComponent)

@export var damage := 25
@export var is_damage_by_itself := true


func _on_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		on_hit.emit(area)
		if not is_damage_by_itself: return
		
		area.damage(damage)
