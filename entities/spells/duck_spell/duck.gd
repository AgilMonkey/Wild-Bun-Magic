extends CharacterBody2D


@export var speed := 150
var is_dead := false
var p_delta
var last_vel: Vector2

@onready var duck_sprite: AnimatedSprite2D = $DuckSprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	get_tree().create_timer(15.0).timeout.connect(func ():
		is_dead = true
		velocity = Vector2.ZERO
		animation_player.play("Smoke")
		await animation_player.animation_finished
		queue_free()
		)
	await get_tree().create_timer(1.0).timeout
	pick_random_pos_to_go_to()


func _physics_process(delta: float) -> void:
	p_delta = delta
	
	move_and_slide()
	
	if velocity.length_squared() > 0:
		duck_sprite.play("walk")
		last_vel = velocity
	else:
		duck_sprite.play("idle")
	
	duck_sprite.flip_h = true if last_vel.x < 0 else false


func pick_random_pos_to_go_to():
	var rand_x = randi_range(-500, 500)
	var rand_y = randi_range(-500, 500)
	var rand_local_position = Vector2(rand_x, rand_y)
	var rand_pos_in_global = global_position + rand_local_position
	
	var to_rand_pos = rand_pos_in_global - global_position
	while to_rand_pos.length() > 5.0:
		if is_dead: return
		to_rand_pos = rand_pos_in_global - global_position
		velocity = to_rand_pos.normalized() * speed
		await get_tree().physics_frame
	velocity = Vector2.ZERO
	await get_tree().create_timer(randf_range(0.0, 3.0)).timeout
	pick_random_pos_to_go_to()
