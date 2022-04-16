extends Control

# Node/Scene References


# Constants


# Variables


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
	pass # Replace with function body.


func _on_Settings_pressed():
	pass # Replace with function body.


func _on_Exit_pressed():
	EventBus.emit_signal("quit_Game")
