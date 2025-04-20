extends Node


var cur_score: int = 0


func _ready() -> void:
	Global.player_killed_an_enemy.connect(add_score)
	GlobalUi.score_berubah.emit(cur_score)

func add_score():
	cur_score += 1
	GlobalUi.score_berubah.emit(cur_score)


func save_highscore():
	if cur_score > HighscoreManager.load_score():
		HighscoreManager.highest_score = cur_score
		HighscoreManager.save_score()
