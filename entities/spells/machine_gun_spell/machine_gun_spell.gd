## Shoot machine gun

extends Spell


var bullet_scene


func _init() -> void:
	spell_name = "Machine Gun"
	description = "M1 to shoot"
	ammo = 70
	damage = 10
	rate_of_fire = 0.2
	
	bullet_scene = preload("res://entities/bullet/player_bullet/bullet.tscn")


func _process(delta: float) -> void:
	if input_holded:
		if is_shooting: return
		if ammo <= 0: return
		is_shooting = true
		ammo -= 1
		var bullet: Bullet = bullet_scene.instantiate()
		bullet.damage = damage
		bullet.global_position = global_position
		bullet.global_rotation = global_rotation
		bullet.velocity = bullet.global_transform.x * speed
		get_tree().current_scene.add_child(bullet)
		spell_casted.emit()
		await get_tree().create_timer(rate_of_fire).timeout
		is_shooting = false


func shoot(_cur_node):
	pass
