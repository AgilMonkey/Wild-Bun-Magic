extends CharacterBody2D


func _ready() -> void:
	await get_tree().create_timer(10.0).timeout
	queue_free()


func _physics_process(delta: float) -> void:
	move_and_slide()
