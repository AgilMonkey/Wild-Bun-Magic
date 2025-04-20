## Shoot machine gun

extends Spell


var laser: Laser
var laser_sound: Node2D


func _init() -> void:
	spell_name = "Laser"
	description = "M1 to shoot"
	ammo = 100
	damage = 10
	rate_of_fire = 0.04


func ready_yerself_dumbass():
	laser_sound = get_node("LaserSound")
	#spell_changed.connect(stop_laser)


func _process(delta: float) -> void:
	if laser == null: laser = get_node("Laser")
	if input_holded and ammo > 0:
		if is_shooting: return
		is_shooting = true
		ammo -= 1
		
		# LOGIC
		laser.process_mode = Node.PROCESS_MODE_INHERIT
		laser.laser_starting.emit()
		
		laser_sound.start_sound()
		
		await get_tree().create_timer(rate_of_fire).timeout
		is_shooting = false
	else:
		stop_laser()


func stop_laser():
	laser.laser_stoping.emit()
	
	laser_sound.end_sound()


func shoot(_cur_node):
	pass
