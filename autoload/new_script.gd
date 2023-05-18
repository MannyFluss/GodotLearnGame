extends Resource
class_name unlockable_song

@export var songStream : AudioStream
@export var unlocked : bool


func _init(song_res = null, is_unlocked = true):
	songStream = song_res
	unlocked = is_unlocked



