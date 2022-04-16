extends Control

# Enums


# Node/Scene References


# Constants
onready var main_menu = "res://scenes/menus/MainMenu.tscn"

# Variables
var choice_made = false

# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	EventBus.emit_signal("ready")

func _process(delta):
	pass

func _physics_process(delta):
	pass


# ------------------------
# --- Custom Functions ---
# ------------------------

# Put functions here

func _on_Replay_pressed():
	choice_made = true
	EventBus.emit_signal("switchScene", main_menu)

func _on_Exit_pressed():
	choice_made = true
	EventBus.emit_signal("quitGame")
