extends Area
class_name Trigger

# Exports
export(String) var trigger_signal
export(Array) var trigger_args
export(bool) var one_shot

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


func _on_Trigger_body_entered(body):
	if body is Actor:
		EventBus.emit_signal(trigger_signal, trigger_args)
		
		if one_shot:
			self.queue_free()
