extends Node2D


@export var laser_audio_start: AudioStreamPlayer
@export var laser_audio_hold: AudioStreamPlayer
@export var laser_audio_end: AudioStreamPlayer

var is_lasering := false


func start_sound():
	if is_lasering: return
	is_lasering = true
	laser_audio_start.play()
	await laser_audio_start.finished
	if not is_lasering: return
	laser_audio_hold.play()


func end_sound():
	if not is_lasering: return
	laser_audio_start.stop()
	laser_audio_hold.stop()
	laser_audio_end.play()
	is_lasering = false
