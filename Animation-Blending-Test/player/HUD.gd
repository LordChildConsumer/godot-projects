extends CanvasLayer

# Exports


# Enums


# Node/Scene References
onready var interact_label = $InteractLabel

# Constants


# Variables


# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	interact_label.text = ""

func _process(delta):
	pass

func _physics_process(delta):
	pass


# ------------------------
# --- Custom Functions ---
# ------------------------

func set_interact_text(text):
	interact_label.text = text
