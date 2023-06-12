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


func _on_area_3d_body_entered(body):
	get_tree().change_scene_to_packed(nextScene)
	pass # Replace with function body.
