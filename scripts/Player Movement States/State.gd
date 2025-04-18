class_name State
extends Node

@export
var moveSpeed: float = 10

var gravity: float = -9.82

var jumpForce: float = 10

var dashForce: float = 15

#håller en referens till parent så att den kan bli kontrollerad av statet
var parent: Player

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	pass

func exit() -> void:
	pass

func get_input_direction() -> Vector3:
	var input_dir = Input.get_vector("move_left", "move_right", "move_back", "move_forward")
	var cam_basis = parent.head.global_transform.basis
	var forward = -cam_basis.z.normalized()
	var right = cam_basis.x.normalized()
	return (right * input_dir.x + forward * input_dir.y).normalized()

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
