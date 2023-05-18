extends Camera2D


@export var cameraSpeed := 600

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input(delta)
	pass

func get_input(delta):
	if (Input.is_action_pressed("ui_up")):
		position.y -= cameraSpeed * delta
	if (Input.is_action_pressed("ui_down")):
		position.y += cameraSpeed * delta
	if (Input.is_action_pressed("ui_right")):
		position.x += cameraSpeed * delta
	if (Input.is_action_pressed("ui_left")):
		position.x -= cameraSpeed * delta
	pass
