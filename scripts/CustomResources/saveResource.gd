class_name SaveGame
extends Resource

const SAVE_GAME_PATH = "user://save.tres"

@export var songsList : Resource

func write_save():
	ResourceSaver.save(songsList,)
