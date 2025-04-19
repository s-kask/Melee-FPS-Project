class_name State
extends Node

@export_category("Movement settings")
@export
var moveSpeed: float = 10.0
@export
var sprintSpeed: float = 20.0
@export
var gravity: float = -9.82
@export
var dashForce: float = 15.0
@export
var jumpForce: float = 10.0
#håller en referens till parent så att den kan bli kontrollerad av statet
var parent: CharacterBody3D

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	pass

func exit() -> void:
	pass

func get_input_direction() -> Vector3:
	return parent.get_input_direction()

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
