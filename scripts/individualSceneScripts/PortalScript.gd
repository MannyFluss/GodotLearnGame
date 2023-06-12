extends Node3D
class_name Portal



@export var DestinationPortal : Portal
@export var PlayerCam : Camera3D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if DestinationPortal:
		var targetCam:Camera3D
		targetCam = DestinationPortal.get_node("SubViewport/Camera3D")
		
		$portalTexture.texture = targetCam.get_viewport().get_texture()
		#I need matrix to calculate the player looking at the portal, to set the camera at the destinationportal to be that so it looks right
		var matrix := DestinationPortal.global_transform * global_transform.inverse() * get_viewport().get_camera_3d().global_transform
		targetCam.position = matrix.origin
		targetCam.rotation = matrix.basis.get_euler()
		
		
		

		
		
	pass
