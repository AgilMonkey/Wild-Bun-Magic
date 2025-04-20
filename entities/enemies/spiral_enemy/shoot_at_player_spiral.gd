extends Node2D


const ENEMY_SHOOT = preload("res://assets/enemy_shoot.wav")

@export var bullet_damage := 10
@export var shoot_timer := 0.25
@export var rot_speed := 25
@export var bullet_speed := 400

@onready var player: Node2D = get_tree().get_first_node_in_group("player")
@onready var enemy_bullet_scene: PackedScene = preload("res://entities/bullet/enemy_bullet/enemy_bullet.tscn")


func _ready() -> void:
	look_at(player.global_position)
	shoot()


func shoot():
	await get_tree().create_timer(shoot_timer).timeout
	
	var start_rot = 0.0
	
	for n in range(4):
		var bullet: EnemyBullet = enemy_bullet_scene.instantiate()
		bullet.damage = bullet_damage
		bullet.global_position = global_position
		bullet.rotate(start_rot + global_rotation)
		bullet.velocity = bullet.global_transform.x * bullet_speed
		get_tree().current_scene.add_child(bullet)
		start_rot += PI * 2 / 4
	
	rotate(deg_to_rad(rot_speed))
	
	SoundManager.play_sound(ENEMY_SHOOT)
	
	shoot()
