extends Node3D
class_name Boid

const ANGLE = 90
const VISION = 10
const MAXSPEED = 2
const MAXSTEER = .3

@onready var BoidContainer = get_parent()

var velocity:Vector3 = Vector3(0,0,0)
var acceleration:Vector3 = Vector3(0,0,0)

func _ready():
	velocity = Vector3(0,1,.5)
	
	pass


func _process(delta):
	print(get_nearby_boids())
	#apply forces
	var boids = get_nearby_boids()
	acceleration += alignment(boids) * 1
	print(acceleration)
	print(velocity)
	velocity = velocity + acceleration
	
	
	translate(velocity * delta)
	
	
	
	
	
	acceleration = Vector3(0,0,0)
	
	pass
	
func alignment(boids:Array)-> Vector3:
	var to_return:Vector3 = Vector3.ZERO
	var count = 0 
	if boids.size() == 0:
		return to_return
	
	if boids.size() != 0:
		for boid in boids:
			to_return + boid.velocity
			count += 1
		to_return/=count
		to_return = to_return.normalized()
		to_return * MAXSPEED
	var steer:Vector3 = to_return - velocity
	steer.limit_length(MAXSTEER)
	return steer
	

func get_nearby_boids() -> Array: 
	var to_return: Array= []
	for boid in BoidContainer.get_children():
		#ignore self
		if boid == self:
			continue
		if position.distance_to(boid.position) < VISION:
			to_return.append(boid)
			
		'''
		var AP = position.direction_to(boid.position)
		var FA = transform.basis * Vector3.FORWARD
		var angle = deg_to_rad(ANGLE)
		if AP.dot(FA) > cos(angle):
			#in range add to list
			to_return.append(boid)
		#if inside of vision area and vision angle add to list
		'''
	return to_return
