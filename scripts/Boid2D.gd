extends Node2D


# Called when the node enters the scene tree for the first time.

var velocity:Vector2
var acceleration:Vector2

var maxForce:float = .3;
var maxSpeed:float = 2


func _ready():
	randomize()
	acceleration = Vector2.ZERO
	var angle = randf_range(0,3.14159265358979 * 2)
	velocity = Vector2(cos(angle),sin(angle))
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	velocity + acceleration
	velocity.limit_length(maxSpeed)
	translate(velocity)
	
	acceleration * Vector2.ZERO
	pass
	
	



