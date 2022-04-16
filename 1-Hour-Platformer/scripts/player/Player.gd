extends KinematicBody2D

# Exports

# Enums


# Node/Scene References


# Constants
const move_speed = 250
const gravity = 750
const jump_force = -425

# Variables
var velocity = Vector2()


# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	velocity.x = 0
	velocity.y += gravity * delta
	
	if is_on_floor():
		print("floor")
		velocity.y = 1
	
	player_movement()
	
	if is_on_ceiling():
		print("ceiling")
		velocity.y = 1
	
	
	move_and_slide(velocity, Vector2.UP, false, 4, deg2rad(45), false)


# ------------------------
# --- Custom Functions ---
# ------------------------

# --- Function for getting player input ---
func player_movement():
	var dir = 0
	
	if Input.is_action_pressed("move_left"):
		dir -= 1
		$Sprite.flip_h = false
	if Input.is_action_pressed("move_right"):
		dir += 1
		$Sprite.flip_h = true
	velocity.x = dir * move_speed
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = jump_force
