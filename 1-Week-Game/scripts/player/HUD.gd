extends CanvasLayer

# Exports


# Enums


# Node/Scene References
onready var interact_label = $InteractLabel
onready var small_pop_up = $SmallPopUp
onready var big_pop_up = $BigPopUp

onready var anim = $AnimationPlayer

# Constants


# Variables


# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	EventBus.connect("_show_Text_Small", self, "display_small_text")
	EventBus.connect("_show_Text_Large", self, "display_large_text")
	interact_label.text = ""

func _process(delta):
	pass

func _physics_process(delta):
	pass


# ------------------------
# --- Custom Functions ---
# ------------------------

func set_interact_text(text):
	interact_label.text = text

func display_small_text(args):
	small_pop_up.text = args[0]
	yield(get_tree().create_timer(args[1]), "timeout")
	anim.play("small_text_fade")
	yield(anim, "animation_finished")
	small_pop_up.text = ""

func display_large_text(text, time):
	pass
