extends Area2D

# Enums

# Node/Scene References


# Constants


# Variables
var pressed = false

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


func _on_Button_body_entered(body):
	$CollisionShape2D.disabled = true
	$Sprite.frame = 149
	pressed = true
	EventBus.emit_signal("_button_Pressed")
