extends Control

# Node/Scene References


# Constants


# Variables
const start_world = "res://source/worlds/World.tscn"

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

# Put functions here

func _on_Start_pressed():
	EventBus.emit_signal("switch_scene", load(start_world))


func _on_Settings_pressed():
	pass # Replace with function body.


func _on_Exit_pressed():
	EventBus.emit_signal("quit_game")
