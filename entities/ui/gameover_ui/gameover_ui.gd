extends Control


signal restart_game


func _on_restart_button_button_down() -> void:
	restart_game.emit()
