extends State

@export
var fallState: State
@export
var jumpState: State
@export
var walkState: State
@export
var sprintState: State

func enter() -> void:
	super()
	parent.velocity.x = 0
	parent.velocity.z = 0
	print("idle state")

#kollar om jumpState eller walkState behöver anropas
func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jumpState
	if Input.is_action_just_pressed("move_forward") or Input.is_action_just_pressed("move_back") or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		return walkState
	return null

#kollar om fallState behöver anropas
func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if !parent.is_on_floor():
		return fallState
	return null
