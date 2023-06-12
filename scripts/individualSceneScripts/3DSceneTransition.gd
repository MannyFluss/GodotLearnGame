extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func SceneTransition(_sceneTarget : PackedScene):
	
	var myTexture = get_viewport().get_texture().get_image()
	var text = ImageTexture.create_from_image(myTexture)
	var mat = StandardMaterial3D.new()
	mat.albedo_texture = text
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	$MeshInstance3D.set_surface_override_material(0,mat)
	$TransitionCamera.make_current()
	$AnimationPlayer.play("SceneTransition")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(_sceneTarget)
	call_deferred("part2Transition")
	#I want to be able to put a function in here that allows me to continue to immediatley make a$transitionCamera the current camera seamlessley
	#await get_tree().process_frame

	#transfer to next scene
func part2Transition():

	var return_cam = get_viewport().get_camera_3d()
	return_cam.clear_current()
	await get_tree().process_frame
	await get_tree().process_frame
	print(return_cam)

	
	var myTexture = return_cam.get_viewport().get_texture().get_image()
	
	$TransitionCamera.make_current()

	return_cam.make_current()

	$TransitionCamera.make_current()
	#I want to get myTexture, but I want to prevent the screen from actually changing cameras and being visible to the player
	#right now doing await get_tree().proccess_frame is causing the image to flicker on screen and then transfer back to the desired cam
	
	await get_tree().process_frame
	await get_tree().process_frame
	
	var text = ImageTexture.create_from_image(myTexture)
	var mat = StandardMaterial3D.new()
	mat.albedo_texture = text
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	$MeshInstance3D.set_surface_override_material(0,mat)
	$TransitionCamera.make_current()
	$AnimationPlayer.play_backwards("SceneTransition")
	await $AnimationPlayer.animation_finished
	
	return_cam.make_current()
