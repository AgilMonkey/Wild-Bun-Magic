extends Node2D

@onready var tutorial_ui: Control = $UI/TutorialUI

func _ready() -> void:
	if not Global.tutorial_done:
		get_tree().paused = true
		tutorial_ui.show()
		await get_tree().create_timer(3.0, true).timeout
		await Global.anythingPressed
	tutorial_ui.queue_free()
	get_tree().paused = false
	Global.tutorial_done = true
	
	Engine.time_scale = 1.0
	randomize()


func _on_player_on_player_died() -> void:
	$UI/GameoverUi.show()
	Engine.time_scale = 0.05


func _on_gameover_ui_restart_game() -> void:
	clear_all_enemy()
	get_tree().call_deferred("reload_current_scene")


# Holy shit clear all Cathy
func clear_all_enemy():
	for n in get_tree().get_nodes_in_group("enemy"):
		n.queue_free()
