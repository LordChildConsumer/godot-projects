extends StaticBody
class_name Interactable

# Exports
export (bool) var enabled = true
export (String) var interact_text = "interact"

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

func can_interact():
	return enabled

func get_interact_text():
	return interact_text

func interact():
	pass
