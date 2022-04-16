extends Area

# Exports
export(String, "area", "area_shape", "body", "body_shape") var watch_for

export(bool) var one_shot
export(String) var enter_signal
export(String) var exit_signal
export(Array) var signal_params

# Enums


# Node/Scene References


# Constants


# Variables


# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	self.connect(str(watch_for, "_entered"), self, "_on_Enter")
	self.connect(str(watch_for, "_exited"), self, "_on_Exit")

func _process(delta):
	pass

func _physics_process(delta):
	pass


# ------------------------
# --- Custom Functions ---
# ------------------------

func _on_Enter(collider):
	pass

