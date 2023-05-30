extends Node3D


@export var dialogueResource : DialogueResource
@export var nextScene : PackedScene
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

func enablePlayer():
	%Player.inputEnabled = true


func _on_detection_dude_area_entered(area):
	if area == %"jump of le map":
		get_tree().change_scene_to_packed(nextScene)
	pass # Replace with function body.
