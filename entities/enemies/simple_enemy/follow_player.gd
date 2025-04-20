extends Node


@export var speed: int = 200

@onready var player: Node2D = get_tree().get_first_node_in_group("player")
@onready var body: CharacterBody2D = get_parent()
@onready var enemy_anim_player: AnimationPlayer = $"../EnemyAnimPlayer"

var being_hit := false


func _ready() -> void:
	enemy_anim_player.play("enemy_anim_lib/walk")

func _physics_process(_delta: float) -> void:
	var to_player = player.global_position - body.global_position
	body.velocity = to_player.normalized() * speed
	if being_hit: body.velocity = to_player.normalized() * speed * 0.5
	body.move_and_slide()


func _on_health_component_hurted() -> void:
	being_hit = true
	await get_tree().create_timer(0.1).timeout
	being_hit = false
