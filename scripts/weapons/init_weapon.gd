@tool

extends Node3D

@export var weaponType: Weapons:
	set(value):
		weaponType = value
		if isReady:
			load_weapon()

@onready var weaponMesh: MeshInstance3D = $WeaponMesh

var isReady = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	isReady = true
	load_weapon()

func _input(event):
	if event.is_action_pressed("weapon1"):
		weaponType = load("res://assets/weapons/sword/katana.tres")
		load_weapon()
	if event.is_action_pressed("weapon2"):
		weaponType = load("res://assets/weapons/sledge/sledge.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func load_weapon() -> void:
	if weaponMesh == null:
		return
	
	weaponMesh.mesh = weaponType.mesh
	position = weaponType.position
	rotation_degrees = weaponType.rotation
