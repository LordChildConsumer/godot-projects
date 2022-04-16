extends Node

# Node References
onready var anim = $Transition/AnimationPlayer
onready var current_scene = $CurrentScene

# Constants


# Variables
var loaded_scene = null

# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	EventBus.connect("quitGame", self, "_quit_game")
	EventBus.connect("switchScene", self, "_switch_scene")

func _process(delta):
	pass

func _physics_process(delta):
	pass


# ------------------------
# --- Custom Functions ---
# ------------------------

# Switch scenes
func _switch_scene(newScene):
	anim.play("fade_to_black")
	yield(anim, "animation_finished")
	current_scene.get_child(0).queue_free()
	
	var scene = ResourceLoader.load(newScene)
	loaded_scene = scene.instance()
	current_scene.add_child(loaded_scene)
	anim.play("fade_to_game")

func _quit_game():
	anim.play("fade_to_black")
	yield(anim, "animation_finished")
	get_tree().quit()
