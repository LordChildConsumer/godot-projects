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
	EventBus.connect("_quit_Game", self, "_quit_game")
	EventBus.connect("_switch_Scene", self, "_switch_scene")

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
	
	current_scene.add_child(newScene.instance())
	
	anim.play("fade_to_game")

func _quit_game():
	anim.play("fade_to_black")
	yield(anim, "animation_finished")
	get_tree().quit()
