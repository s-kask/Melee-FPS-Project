extends State

@export
var idleState: State
@export
var walkState: State
@export
var dashState: State

@onready var head: Node3D = $"../../Head"


# Called when the node enters the scene tree for the first time.
func enter() -> void:
	super()
	print("fall state")

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	var direction = get_input_direction()
	
	var airControl = 2.0
	parent.velocity.x = lerp(parent.velocity.x, direction.x * moveSpeed, delta * airControl)
	parent.velocity.z = lerp(parent.velocity.z, direction.z * moveSpeed, delta * airControl)
	
	if !parent.is_on_floor() and Input.is_action_just_pressed("sprint"):
		return dashState
	
	if parent.is_on_floor():
		if direction.length() != 0:
			return walkState
		return idleState
	return null
