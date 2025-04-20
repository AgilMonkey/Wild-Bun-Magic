extends Spell


var duck_scene
var duck_sound: AudioStream


func _init() -> void:
	spell_name = "Duck"
	description = "Quack"
	ammo = 5
	damage = 0
	rate_of_fire = 1.0
	speed = 1000
	
	duck_scene = preload("res://entities/spells/duck_spell/duck.tscn")
	duck_sound = preload("res://assets/duck.wav")


func shoot(_cur_node: Node2D):
	if is_shooting: return
	is_shooting = true
	ammo -= 1
	
	var duck: CharacterBody2D = duck_scene.instantiate()
	duck.global_position = global_position
	get_tree().current_scene.add_child(duck)
	shoot_duck(duck)
	
	var sound := SoundManager.play_sound(duck_sound)
	sound.pitch_scale = randf_range(0.8, 1.5)
	
	await get_tree().create_timer(rate_of_fire).timeout
	is_shooting = false


func shoot_duck(duck: CharacterBody2D):
	duck.velocity = global_transform.x * speed
	get_tree().create_timer(0.4).timeout.connect(func ():
		duck.velocity = Vector2.ZERO
	)
