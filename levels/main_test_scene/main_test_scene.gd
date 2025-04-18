extends Node2D


func _ready() -> void:
	randomize()


func _on_player_on_player_died() -> void:
	$UI/GameoverUi.show()
	$Player.process_mode = Node.PROCESS_MODE_DISABLED


func _on_gameover_ui_restart_game() -> void:
	clear_all_enemy()
	get_tree().call_deferred("reload_current_scene")


# Holy shit clear all Cathy
func clear_all_enemy():
	for n in get_tree().get_nodes_in_group("enemy"):
		n.queue_free()
