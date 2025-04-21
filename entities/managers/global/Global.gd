extends Node


signal player_killed_an_enemy
signal anythingPressed

var tutorial_done := false


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


func _input(event):
	if Input.is_anything_pressed():
		anythingPressed.emit()
