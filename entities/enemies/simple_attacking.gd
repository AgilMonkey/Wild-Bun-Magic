extends Node


@export var damage: int = 10
@export var wait_time: float = 2.0
@export var attackbox: AttackboxComponent
@export var attackbox_col: CollisionShape2D

var is_waiting := false


func _ready() -> void:
	attackbox.on_hit.connect(attack)


func attack(_hitbox: HitboxComponent):
	if is_waiting: return
	if not _hitbox.get_parent().is_in_group("player"): return
	_hitbox.damage(damage)
	attackbox_col.call_deferred("set_disabled", true)
	await get_tree().create_timer(wait_time).timeout
	attackbox_col.call_deferred("set_disabled", false)
