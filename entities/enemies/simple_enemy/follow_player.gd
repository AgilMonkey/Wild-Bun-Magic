extends Node


@export var speed: int = 200

@onready var player: Node2D = get_tree().get_first_node_in_group("player")
@onready var body: CharacterBody2D = get_parent()
@onready var enemy_anim_player: AnimationPlayer = $"../EnemyAnimPlayer"


func _ready() -> void:
	enemy_anim_player.play("walk")

func _physics_process(_delta: float) -> void:
	var to_player = player.global_position - body.global_position
	body.velocity = to_player.normalized() * speed
	body.move_and_slide()
