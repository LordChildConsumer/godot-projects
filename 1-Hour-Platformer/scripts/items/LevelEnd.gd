extends Area2D

# Enums

# Node/Scene References


# Constants


# Variables
var locked = true

# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	EventBus.connect("_button_Pressed", self, "_on_Button_Pressed")

func _process(delta):
	pass

func _physics_process(delta):
	pass


# ------------------------
# --- Custom Functions ---
# ------------------------

func _on_Button_Pressed():
	$Sprite.visible = true
	locked = false

func _on_LevelEnd_body_entered(body):
	if !locked:
		$Particles2D.emitting = true
		$Sprite.visible = false
		yield(get_tree().create_timer(2), "timeout")
		EventBus.emit_signal("_quit_Game")
