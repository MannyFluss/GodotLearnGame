extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_pressed():
	GlobalAudioController.nextSong()
	pass # Replace with function body.


func _on_previous_pressed():
	GlobalAudioController.previousSong()
	pass # Replace with function body.


func _on_button_pressed():
	GlobalAudioController.togglePlay()
	pass # Replace with function body.
	


func _on_up_pressed():
	GlobalAudioController.editVolume(1)
	pass # Replace with function body.


func _on_down_pressed():
	GlobalAudioController.editVolume(-1)
	
	pass # Replace with function body.
