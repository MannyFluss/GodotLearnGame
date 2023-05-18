extends Node

# Called when the node enters the scene tree for the first time.

@export var songList : Array[unlockable_song]


func _ready():
	$AudioStreamPlayer.stream = songList[0].songStream
	$AudioStreamPlayer.play()
	
	#radioSoundStream.stream = testStream
	#radioSoundStream.play()
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.




func _process(delta):
	pass
