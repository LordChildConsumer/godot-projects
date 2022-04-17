extends Area2D
class_name LevelEnd

# Exports
export(bool) var locked
export(int) var id

# Enums


# Node/Scene References
onready var lock_sprite = $Lock
onready var unlock_fx = $Unlock

# Constants


# Variables


# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	EventBus.connect("pickup_key", self, "_on_Key_Pickup")
	
	if locked:
		lock_sprite.visible = true

func _process(delta):
	pass

func _physics_process(delta):
	pass


# ------------------------
# --- Custom Functions ---
# ------------------------

func _on_Key_Pickup(key_id):
	if key_id == id:
		locked = false
		lock_sprite.visible = false
		unlock_fx.emitting = true
