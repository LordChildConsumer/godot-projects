extends Area2D
export(String) var next_level

# Enums

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


func _on_LevelEnd_body_entered(body):
	print("level end hit")
	if next_level == null:
		print("level is null")
	else:
		EventBus.emit_signal("switchScene", next_level)
