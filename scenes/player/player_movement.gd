extends Node


@export var speed: float = 200.0
@export var dash_speed: float = 800.0
@export var dash_time: float = 0.2
@export var dash_cooldown_time: float = 2.0

var is_dashing: bool = false
var can_dash: bool = true

var input_dir: Vector2

@onready var body: CharacterBody2D = get_parent()


func _input(event: InputEvent) -> void:
	input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("dash"):
		dash()
	
	if not is_dashing:
		body.velocity = input_dir * speed
	
	body.move_and_slide()


func dash():
	if is_dashing: return
	if not can_dash: return
	is_dashing = true
	dash_cooldown()
	
	body.velocity = input_dir * dash_speed
	await get_tree().create_timer(dash_time).timeout
	is_dashing = false
	

func dash_cooldown():
	if not can_dash: return
	can_dash = false
	await get_tree().create_timer(dash_cooldown_time).timeout
	can_dash = true
