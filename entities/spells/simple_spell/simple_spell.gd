extends Spell


var bullet_scene


func _init() -> void:
	spell_name = "Simple"
	description = "M1 to shoot"
	ammo = 15
	damage = 50
	rate_of_fire = 0.6
	
	bullet_scene = preload("res://entities/bullet/bullet.tscn")


func shoot(_cur_node: Node2D):
	if is_shooting: return
	is_shooting = true
	ammo -= 1
	
	var bullet: Bullet = bullet_scene.instantiate()
	bullet.damage = damage
	bullet.global_position = global_position
	bullet.velocity = global_transform.x * speed
	get_tree().current_scene.add_child(bullet)
	
	await get_tree().create_timer(rate_of_fire).timeout
	is_shooting = false
