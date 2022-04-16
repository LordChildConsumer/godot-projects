extends KinematicBody2D

# Node References


# Constants
const move_speed = 200
const gravity = 400
const jump_force = -250

# Variables
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
	pass

# ------------------------
# --- Custom Functions ---
# ------------------------

func get_input():
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
