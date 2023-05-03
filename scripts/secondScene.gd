extends Node2D




@onready var gdsam : GDSAM = $GDSAM
# Called when the nod enters the scene tree for the first time.
func _ready():
	#gdsam.speak($GDSAM/AudioStreamPlayer,"this is a test")
	pass


func _on_button_pressed():
	gdsam.speak($GDSAM/AudioStreamPlayer,$Control/TextEdit.text)
	pass # Replace with function body.


func _on_button_2_pressed():
	gdsam.speak($GDSAM/AudioStreamPlayer,$TextEdit4.text)
	pass # Replace with function body.
