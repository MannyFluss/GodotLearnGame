extends Node3D


@export var dialogueResource : DialogueResource

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_example_dialogue_balloon(dialogueResource,"Start")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func ThisIsATest():
	print("this is an epic test oh yeahhhhh")
	pass
	
func setVis():
	%grassMeshes.visible = true
	
func ballsRiseUp():
	%AnimationPlayer.play("fun joyous animation")
