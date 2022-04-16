extends Node

onready var mouse_sens: float = 0.5 	setget set_mouse_sens, get_mouse_sens
onready var cam_fov: float = 70			setget set_cam_fov, get_cam_fov

# ---------------
# --- Setgets ---
# ---------------

# --- Mouse Sens ---
func set_mouse_sens(value):
	mouse_sens = value
func get_mouse_sens():
	return mouse_sens

# --- Cam FOV ---
func set_cam_fov(value):
	cam_fov = value
func get_cam_fov():
	return cam_fov
