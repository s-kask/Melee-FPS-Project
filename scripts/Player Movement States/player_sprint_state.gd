extends State

@export
var idleState : State
@export
var jumpState : State
@export
var fallState : State
@export
var walkState : State

var speed


# Called when the node enters the scene tree for the first time.
func enter() -> void:
	super()
	speed = sprintSpeed
	print("sprint state")

func process_physics(delta: float) -> State:
	var direction = get_input_direction()
	
	if parent.is_on_floor():
		if direction:
			parent.velocity.x = direction.x * speed
			parent.velocity.z = direction.z * speed
		else:
			parent.velocity.x = lerp(parent.velocity.x, direction.x * speed, delta * 7.0)
			parent.velocity.z = lerp(parent.velocity.z, direction.z * speed, delta * 7.0)
	else:
		parent.velocity.x = lerp(parent.velocity.x, direction.x * speed, delta * 2.0)
		parent.velocity.z = lerp(parent.velocity.z, direction.z * speed, delta * 2.0)
	
	parent.velocity.y += gravity * delta
	
	#fall check
	if !parent.is_on_floor():
		return fallState
	
	if Input.is_action_just_released("sprint"):
		return walkState
	
	#jump check
	if Input.is_action_just_pressed("jump"):
		return jumpState
	
	if direction.length() == 0:
		return idleState
	return null
	
