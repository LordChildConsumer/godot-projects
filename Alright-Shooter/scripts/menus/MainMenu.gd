extends Control

# Node/Scene References
onready var start_scene = "res://scenes/worlds/World.tscn"

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

func disable_all():
	$Start.disabled = true
	$Settings.disabled = true

func _on_Start_pressed():
	EventBus.emit_signal("switchScene", start_scene)


func _on_Settings_pressed():
	pass # Replace with function body.


func _on_Exit_pressed():
	EventBus.emit_signal("quitGame")
