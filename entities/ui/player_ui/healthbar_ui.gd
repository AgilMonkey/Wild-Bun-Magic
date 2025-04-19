extends Control


func _ready() -> void:
	GlobalUi.player_health.health_changed.connect(health_changed)


func health_changed(val: int):
	$ProgressBar.value = val
