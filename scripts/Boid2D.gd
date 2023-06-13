extends Node2D
class_name Boid2D

# Called when the node enters the scene tree for the first time.
const RANGE = 1000
const STARTSPEED = 100

var velocity:Vector2
var acceleration:Vector2

var maxForce:float = .1;
var maxSpeed:float = 1000
var minSpeed: float = 100

@onready var Flock = get_parent()

func _ready():
	randomize()
	acceleration = Vector2.ZERO
	var angle = randf_range(0,3.14159265358979 * 2)
	velocity = Vector2(cos(angle) ,sin(angle))
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#flocking behaviors5
	flocking_behaviors()
	#update pos
	velocity += acceleration
	velocity = velocity.limit_length(maxSpeed)
	
	velocity = velocity.clamp(Vector2(-100,-100),Vector2(100,100))
	translate(velocity * delta)
	acceleration *= 0
	pass
	
func flocking_behaviors():
	var alignment:Vector2 = align() * 0
	var seperation:Vector2 = seperate() * 1
	var cohesion:Vector2 = cohesion() * 1
	#add all vectors to the acceleration
	acceleration += alignment
	acceleration += seperation
	acceleration += cohesion
#gets the direction of all other boids nearby, averages that value and applies it to return vector
func align() -> Vector2:
	var none:Vector2 = Vector2(0,0)
	#todo fill
	var overall:Vector2 = Vector2(0,0)
	var count = 0
	for boid in get_flock():
		var d = position.distance_to(boid.position)
		if d > 0 and d < 500:
			overall += boid.velocity
			count += 1
	if count > 0:
		overall = overall/float(count)
		overall = overall.normalized()
		
		var steer:Vector2 = overall - velocity
		steer = steer.limit_length(maxForce)
		
		return steer
	return none

func seperate() -> Vector2:
	var to_return:Vector2 = Vector2(0,0)
	#todo fill
	return to_return

func cohesion() -> Vector2:
	var to_return:Vector2 = Vector2(0,0)
	#todo fill
	return to_return

func get_flock() -> Array[Boid2D]:
	var to_return:Array[Boid2D] = []
	for boid in Flock.get_children():
		if boid == self:
			continue
		#add condition of being behind
		if position.distance_to(boid.position) < RANGE:
			to_return.append(boid)
	
	return to_return
