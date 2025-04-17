extends Node


@export var speed: float = 200.0


var input_dir: Vector2

@onready var body: CharacterBody2D = get_parent()


func _input(event: InputEvent) -> void:
	input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")


func _physics_process(delta: float) -> void:
	body.velocity = input_dir * speed
	body.move_and_slide()
