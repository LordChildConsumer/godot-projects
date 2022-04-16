extends KinematicBody
class_name Player

# Exports


# Enums


# Node/Scene References
onready var head = $Head
onready var ground_check = $GroundCheck


# Constants
const move_speed = 250
const acceleration = 0.75
const friction = 0.75

const gravity = 35
const jump_force = 25

# Variables
var direction = Vector3()
var velocity = Vector3()


# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	pass

func _physics_process(delta):
	# Debug Quit
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	direction = Vector3.ZERO
	# --- Player Movement ---
	
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	if Input.is_action_pressed("move_backward"):
		direction += transform.basis.z
	
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	if Input.is_action_pressed("move_right"):
		direction += transform.basis.x
	
	direction = direction.normalized()
	
	# Accelerate
	if direction != Vector3.ZERO:
		velocity.x = lerp(velocity.x, direction.x * move_speed, acceleration * delta)
		velocity.z = lerp(velocity.z, direction.z * move_speed, acceleration * delta)
	# Decelerate
	else:
		velocity.x = lerp(velocity.x, 0, friction * delta)
		velocity.z = lerp(velocity.z, 0, friction * delta)
	
	
	
	move_and_slide(velocity, Vector3.UP)

func _unhandled_input(event):
	# Mouse Look
	if event is InputEventMouseMotion && Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * (PlayerConfig.mouse_sens / 100))
		head.rotate_x(-event.relative.y * (PlayerConfig.mouse_sens / 100))
		head.rotation.x = clamp(head.rotation.x, -1.2, 1.2)

# ------------------------
# --- Custom Functions ---
# ------------------------
