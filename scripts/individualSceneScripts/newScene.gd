extends Node3D


@export var scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var myTexture = get_viewport().get_texture().get_image()
	var text = ImageTexture.create_from_image(myTexture)
	var mat = StandardMaterial3D.new()
	mat.albedo_texture = text
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	$MeshInstance3D.set_surface_override_material(0,mat)
	$TransitionCamera.make_current()
	$AnimationPlayer.play("SceneTransition")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	$Sprite3D2.visible = true
	await get_tree().create_timer(1).timeout
	$Sprite3D2/AnimationPlayer.play("funnyrotate")
	await $Sprite3D2/AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(scene)
	
	pass # Replace with function body.
