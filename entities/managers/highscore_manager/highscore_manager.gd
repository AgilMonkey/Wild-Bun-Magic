extends Node


const SAVEFILE = "user://wild-bun-magic.save"

var highest_score: int = 0


func _ready() -> void:
	pass


func save_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE_READ)
	file.store_32(highest_score)


func load_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	if FileAccess.file_exists((SAVEFILE)):
		highest_score = file.get_32()
