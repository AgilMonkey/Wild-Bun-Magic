extends Node


@export var speed: float = 250.0
@export var dash_speed: float = 700.0
@export var dash_time: float = 0.3
@export var dash_cooldown_time: float = 2.0

var is_dashing: bool = false
var can_dash: bool = true

var input_dir: Vector2
var last_input_dir: Vector2

@onready var body: CharacterBody2D = get_parent()


func _input(_event: InputEvent) -> void:
	input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")


func _process(_delta: float) -> void:
	if input_dir.length_squared() > 0:
		last_input_dir = input_dir


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("dash"):
		dash()
	
	if not is_dashing:
		body.velocity = input_dir * speed
	
	body.move_and_slide()


func dash():
	if is_dashing: return
	if can_dash == false: return
	is_dashing = true
	dash_cooldown()
	
	body.velocity = last_input_dir * dash_speed
	await get_tree().create_timer(dash_time).timeout
	is_dashing = false
	

func dash_cooldown():
	if can_dash == false: return
	can_dash = false
	await get_tree().create_timer(dash_cooldown_time).timeout
	can_dash = true
