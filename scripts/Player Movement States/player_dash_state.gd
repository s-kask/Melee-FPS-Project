extends State

@export
var fallState : State

var dash_force

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	super()
	dash_force = dashForce
	print("dash state")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	var direction = get_input_direction()
	
	if !parent.is_on_floor():
		parent.velocity.x = direction.x * dash_force
		parent.velocity.z = direction.z * dash_force
	else:
		parent.velocity.x = lerp(parent.velocity.x, direction.x * dash_force, delta * 7.0)
		parent.velocity.z = lerp(parent.velocity.z, direction.z * dash_force, delta * 7.0)
	
	#fall check
	if !parent.is_on_floor and parent.velocity.x != 0 or parent.velocity.z != 0:
		return fallState
	
	return null
	
