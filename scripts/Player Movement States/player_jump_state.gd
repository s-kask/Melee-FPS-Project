extends State

@export
var fallState: State
@export
var idleState: State
@export
var walkState: State


func enter() -> void:
	super()
	parent.velocity.y = jumpForce
	print("jump state")


func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fallState
	
	return null
