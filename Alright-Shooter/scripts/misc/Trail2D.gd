extends Position2D

# Enums


# Node/Scene References
onready var line = $Line2d

# Constants


# Variables
export var length = 50
var point = Vector2()

# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	pass

func _process(delta):
	line.global_position = Vector2(0, 0)
	line.global_rotation = 0

func _physics_process(delta):
	point = get_parent().global_position
	
	line.add_point(point)
	while line.get_point_count() > length:
		line.remove_point(0)


# ------------------------
# --- Custom Functions ---
# ------------------------

# Put functions here
