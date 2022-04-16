tool
extends Control

signal toggled(is_button_pressed)

# Exports
export var title := "" setget set_title
onready var label := $Label


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

func set_title(value: String) -> void:
	title = value
	if not label:
		yield(self, "ready")
	label.text = title

func _on_CheckBox_toggled(button_pressed):
	emit_signal("toggled", button_pressed)

