extends Area2D
class_name Pickup

# Exports
export(int) var id = 0

# Enums


# Node/Scene References
onready var anim = $AnimationPlayer


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

func _on_Pickup_body_entered(body):
	if !body is Player:
		return
	anim.play("pickup")
	EventBus.emit_signal("pickup_key", id)
