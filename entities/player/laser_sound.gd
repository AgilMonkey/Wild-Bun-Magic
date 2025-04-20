extends Node2D


@export var laser_audio_start: AudioStreamPlayer
@export var laser_audio_hold: AudioStreamPlayer
@export var laser_audio_end: AudioStreamPlayer


func start_sound():
	if laser_audio_start.playing or laser_audio_hold.playing: return
	laser_audio_start.play()
	await laser_audio_start.finished
	laser_audio_hold.play()


func end_sound():
	if not laser_audio_hold.playing: return
	laser_audio_start.stop()
	laser_audio_hold.stop()
	laser_audio_end.play()
