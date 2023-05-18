extends Node

# Called when the node enters the scene tree for the first time.

@onready var myAudioStream : AudioStreamPlayer = $AudioStreamPlayer
@export var songList : Array[unlockable_song]
var currIndex = 0
#radio with following features
#play/pause song - 
#skip song - 
#put on shuffle nah fuck dat for now
#skip a song that is not currently unlocked -
#up and down vol - 

func _ready():
	if len(songList) > 0:
		currIndex = 0
		myAudioStream.stream = songList[0].songStream
	editVolume(-16)
	
	
	
func togglePlay():
	if myAudioStream.playing:
		myAudioStream.stop()
	else:
		myAudioStream.play()
	
func nextSong():
	myAudioStream.stop()
	currIndex = findNextValidIndex()
	myAudioStream.stream = songList[currIndex].songStream
	myAudioStream.play()

func previousSong():
	myAudioStream.stop()
	currIndex = findPreviousValidIndex()
	myAudioStream.stream = songList[currIndex].songStream
	myAudioStream.play()
	
func findNextValidIndex() -> int:
	var count = 0
	var tempIndex = currIndex
	while (true):
		count += 1
		tempIndex += 1
		if tempIndex == len(songList):
			tempIndex = 0
		if songList[tempIndex].unlocked:
			return tempIndex
		#no valid songs
		if count == len(songList):
			return -1
	return -1
func findPreviousValidIndex() -> int:
	var count = 0
	var tempIndex = currIndex
	while (true):
		count += 1
		tempIndex -= 1
		if tempIndex == -1:
			tempIndex = len(songList) -1
		if songList[tempIndex].unlocked:
			return tempIndex
		#no valid songs
		if count == len(songList):
			return -1
	return -1
	
func editVolume(value : float):
	myAudioStream.volume_db += value


func _on_audio_stream_player_finished():
	nextSong()
	pass # Replace with function body.
