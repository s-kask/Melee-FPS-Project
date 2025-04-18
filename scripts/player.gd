class_name Player
extends CharacterBody3D

@onready var stateMachine: Node = $PlayerMovementState
@onready var head: Node3D = $Head
@onready var pov: Camera3D = $Head/POV


var cameraEnabled := true
const SENSITIVITY = 0.003

#initiera state maskinen, passar en referens till spelaren till alla states 
#så den kan röra sig och reagera som den ska
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	stateMachine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	if cameraEnabled and event is InputEventMouseMotion:
		rotate_y(-event.relative.x * SENSITIVITY)
		head.rotate_x(-event.relative.y * SENSITIVITY)
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-70), deg_to_rad(70))
	stateMachine.process_input(event)
	

func _physics_process(delta: float) -> void:
	stateMachine.process_physics(delta)
	move_and_slide()

func _process(delta: float) -> void:
	stateMachine.process_frame(delta)
