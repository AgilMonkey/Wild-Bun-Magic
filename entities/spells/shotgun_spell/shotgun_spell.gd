## Shoot 4 bullets in a circular stuff

extends Spell


var bullet_scene


func _init() -> void:
	spell_name = "Shotgun"
	description = "M1 to shoot"
	ammo = 10
	damage = 25
	rate_of_fire = 1.0
	
	bullet_scene = preload("res://entities/bullet/bullet.tscn")


func shoot(_cur_node: Node2D):
	if is_shooting: return
	is_shooting = true
	ammo -= 1
	
	# Reduce (Increase this to 40 then
	var start_rot = -40
	
	for n in range(5):
		var bullet: Bullet = bullet_scene.instantiate()
		bullet.damage = damage
		bullet.global_position = global_position
		bullet.global_rotation = global_rotation
		bullet.rotate(deg_to_rad(start_rot))
		bullet.velocity = bullet.global_transform.x * speed
		get_tree().current_scene.add_child(bullet)
		start_rot += 20
	
	await get_tree().create_timer(rate_of_fire).timeout
	is_shooting = false
