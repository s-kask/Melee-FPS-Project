class_name EntityBase
extends CharacterBody3D

@export
var jumpForce: float = 10
var wantsToJump := false

func get_input_direction() -> Vector3:
	return Vector3.ZERO

func wants_jump():
	if wantsToJump and is_on_floor():
		velocity.y = jumpForce
		wantsToJump = false
