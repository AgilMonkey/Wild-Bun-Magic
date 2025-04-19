extends Node


@onready var body: CharacterBody2D = get_parent()


func _physics_process(delta: float) -> void:
	for i in body.get_slide_collision_count():
		var collision = body.get_slide_collision(i)
		print("Collided with: ", collision.get_collider().name)
