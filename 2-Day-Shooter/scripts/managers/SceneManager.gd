extends Node

# Node References
onready var anim = $Transition/AnimationPlayer
onready var current_scene = $CurrentScene

# Constants


# Variables


# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	EventBus.connect("quitGame", self, "_quit_game")
	EventBus.connect("switchScene", self, "_switch_scene")
	EventBus.connect("ready", self, "_fade_to_game")

func _process(delta):
	pass

func _physics_process(delta):
	pass


# ------------------------
# --- Custom Functions ---
# ------------------------

# Listen for new_scene to be ready
func _fade_to_game():
	anim.play("fade_to_game")

# Switch scenes
func _switch_scene(newScene):
	anim.play("fade_to_black")
	yield(anim, "animation_finished")
	current_scene.get_child(0).queue_free()
	
	var new_scene = load(newScene)
	current_scene.add_child(new_scene.instance())

func _quit_game():
	anim.play("fade_to_black")
	yield(anim, "animation_finished")
	get_tree().quit()
