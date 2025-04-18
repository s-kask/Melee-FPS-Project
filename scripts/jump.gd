extends State

@export
var fallState: State
@export
var idleState: State
@export
var walkState: State

@export
var jumpForce: float = 10

func enter() -> void:
	super()
	parent.velocity.y = jumpForce
	print("jump state")


func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	#var inputDirection = Vector3.ZERO
	
	if parent.velocity.y > 0:
		return fallState
	
	# Input.get_axis returnerar -1, 0 eller 1 beroende på vilka tangenter som trycks
	var fAndB = Input.get_axis("move_back", "move_forward") * moveSpeed
	var sideways = Input.get_axis("move_left", "move_right") * moveSpeed
	
	parent.velocity.x = fAndB
	parent.velocity.z =sideways
	
	return null
