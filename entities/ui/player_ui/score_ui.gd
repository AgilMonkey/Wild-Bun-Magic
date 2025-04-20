extends Control


@onready var score := $Score


func _ready() -> void:
	GlobalUi.score_berubah.connect(func(x):
		score.text = str(x)
		)
