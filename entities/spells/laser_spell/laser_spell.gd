## Shoot machine gun

extends Spell


var laser: Laser


func _init() -> void:
	spell_name = "Laser"
	description = "M1 to shoot"
	ammo = 100
	damage = 10
	rate_of_fire = 0.04



func _process(delta: float) -> void:
	if laser == null: laser = get_node("Laser")
	if input_holded and ammo > 0:
		if is_shooting: return
		is_shooting = true
		ammo -= 1
		
		# LOGIC
		laser.show()
		laser.process_mode = Node.PROCESS_MODE_INHERIT
		
		await get_tree().create_timer(rate_of_fire).timeout
		is_shooting = false
	else:
		laser.hide()
		laser.process_mode = Node.PROCESS_MODE_DISABLED


func shoot(_cur_node):
	pass
