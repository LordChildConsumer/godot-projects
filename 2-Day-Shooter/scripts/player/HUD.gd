extends CanvasLayer

# Enums

# Node/Scene References
onready var player_node = get_parent().get_parent()

# Constants


# Variables


# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	player_node.connect("update_health", self, "_update_Health_Bar")

func _process(delta):
	pass

func _physics_process(delta):
	pass


# ------------------------
# --- Custom Functions ---
# ------------------------

func _update_Health_Bar():
	pass
