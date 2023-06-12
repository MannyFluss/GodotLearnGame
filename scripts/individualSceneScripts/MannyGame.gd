extends Node3D


@export var nextScene : PackedScene
@export var dialogue : DialogueResource

# Called when the node enters the scene tree for the first time.
func _ready():

	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().create_timer(.2).timeout
	'''
	var myTexture = get_viewport().get_texture().get_image()
	var text = ImageTexture.create_from_image(myTexture)
	var mat = StandardMaterial3D.new()
	mat.albedo_texture = text
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	$SceneTransition/MeshInstance3D.set_surface_override_material(0,mat)
	$SceneTransition/TransitionCamera.make_current()
	'''
	DialogueManager.show_example_dialogue_balloon(dialogue,"Start")

func gotoNext():
	get_tree().change_scene_to_packed(nextScene)
	
