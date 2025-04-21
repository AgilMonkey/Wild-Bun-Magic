extends Control


const MAIN_SCENE = "res://levels/main/main.tscn"




func _on_play_button_button_down() -> void:
	get_tree().change_scene_to_file(MAIN_SCENE)
