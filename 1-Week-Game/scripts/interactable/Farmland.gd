extends Interactable

# Exports
export(String, "tomato", "carrot") var crop_type


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

func interact():
	EventBus.emit_signal("_%s_Harvested" % crop_type)
	EventBus.emit_signal("_show_Text_Small", ["%s planted" % crop_type, 1])
