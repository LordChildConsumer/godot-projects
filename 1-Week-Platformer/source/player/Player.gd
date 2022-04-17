extends KinematicBody2D
class_name Player

# Exports


# Enums


# Node/Scene References
onready var ground_check = $GroundCheck
onready var anim = $AnimationPlayer
onready var sprite = $Sprite


# Constants


# Variables
var jumps_left = 2

var velocity = Vector2()
var direction = Vector2()

var gravity = 250
var gravity_accel = 0.05

var jump_force = 500
var acceleration = 0.25
var friction = 0.15
var air_friction = 0.05
var move_speed = 200

# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	# --- Walking ---
	direction = 0
	
	if Input.is_action_pressed("move_left"):
		direction -= 1
		sprite.flip_h = true
	if Input.is_action_pressed("move_right"):
		direction += 1
		sprite.flip_h = false
	
	if direction != 0:
		# Accelerate
		anim.play("walk")
		velocity.x = lerp(velocity.x, direction * move_speed, acceleration)
	elif !ground_check.is_colliding():
		# Decelerate in the air
		anim.play("idle")
		velocity.x = lerp(velocity.x, 0, air_friction)
	else:
		# Decelerate
		anim.play("idle")
		velocity.x = lerp(velocity.x, 0, friction)
	
	# --- Gravity ---
	if ground_check.is_colliding():
		velocity.y = 1
		jumps_left = 2
	else:
		velocity.y = lerp(velocity.y, gravity, gravity_accel)
	
	# --- Jumping ---
	if Input.is_action_just_pressed("jump") && jumps_left > 0:
		match jumps_left:
			2:
				velocity.y = -jump_force
			_:
				velocity.y = -(jump_force * .75)
		jumps_left -= 1
	
	move_and_slide(
		velocity,
		Vector2.UP,
		false,
		4,
		deg2rad(45),
		false
	)


# ------------------------
# --- Custom Functions ---
# ------------------------
