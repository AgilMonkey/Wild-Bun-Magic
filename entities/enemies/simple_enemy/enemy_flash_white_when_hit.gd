extends Node


@export var flash_white_player: AnimationPlayer


func flash_white():
	flash_white_player.play("flash_white")
