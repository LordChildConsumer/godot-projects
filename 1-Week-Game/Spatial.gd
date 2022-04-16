extends Spatial

# Exports


# Enums


# Node/Scene References
onready var cube = $MeshInstance

# Constants


# Variables
var moving = false

# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	if Input.is_action_pressed("jump"):
		moving = true
	
	if moving:
		cube.global_transform.origin = lerp(cube.global_transform.origin, Vector3.ZERO, 0.75 * delta)
		


# ------------------------
# --- Custom Functions ---
# ------------------------

# Put functions here
