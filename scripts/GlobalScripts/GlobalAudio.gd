extends Node

# Called when the node enters the scene tree for the first time.
@export var testStream : AudioStream = preload("res://audio/Songs/s_music.mp3")


func _ready():
	$AudioStreamPlayer.stream = testStream
	$AudioStreamPlayer.play()
	
	#radioSoundStream.stream = testStream
	#radioSoundStream.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
