extends State

@export
var idleState : State
@export
var jumpState : State
@export
var fallState : State
@export
var sprintState : State


var speed
const WALK_SPEED = 5.0


# Called when the node enters the scene tree for the first time.
func enter() -> void:
	super()
	speed = WALK_SPEED
	print("walk state")

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
	
	if Input.is_action_pressed("sprint"):
		return sprintState
	
	#jump check
	if Input.is_action_just_pressed("jump"):
		return jumpState
	
	if direction.length() == 0:
		return idleState
	return null
	
