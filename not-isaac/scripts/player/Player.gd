extends KinematicBody2D

# Enums


# Node/Scene References
onready var anim = $AnimationHandler

# Constants


# Variables
var move_speed = 150
var acceleration = 0.1
var friction = 0.1

var direction = Vector2()
var velocity = Vector2()

# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	# --- Movement ---
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	anim.process_direction(direction)
	
	direction = direction.normalized()
	
	if direction != Vector2.ZERO:
		velocity = lerp(velocity, direction * move_speed, acceleration)
	else:
		velocity = lerp(velocity, direction * move_speed, friction)
		anim.stop_Body_Animations()
	
	move_and_slide(velocity)
	
	# --- Shooting ---
	if Input.is_action_pressed("shoot_up"):
		anim.play_Shoot_Up()
	if Input.is_action_pressed("shoot_down"):
		anim.play_Shoot_Down()
	if Input.is_action_pressed("shoot_left"):
		anim.play_Shoot_Left()
	if Input.is_action_pressed("shoot_right"):
		anim.play_Shoot_Right()


# ------------------------
# --- Custom Functions ---
# ------------------------
