extends Node2D

# Enums


# Node/Scene References
onready var camera = $Camera2D
onready var shake_timer = $Timer
onready var tween = $Tween

# Constants


# Variables
var shake_amount = 0
var default_offset = Vector2.ZERO

# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	EventBus.connect("shakePlayerCamera", self, "shake")
	set_process(false)

func _process(delta):
	camera.offset = Vector2(rand_range(-shake_amount, shake_amount), rand_range(-shake_amount, shake_amount)) * delta + default_offset

func _physics_process(delta):
	pass

# ------------------------
# --- Custom Functions ---
# ------------------------

func shake(new_shake, shake_time, shake_limit):
	shake_amount += new_shake
	print(shake_amount)
	if shake_amount > shake_limit:
		shake_amount = shake_limit
	
	shake_timer.wait_time = shake_time
	
	tween.stop_all()
	set_process(true)
	shake_timer.start()


func _on_Shake_Timer_timeout():
	shake_amount = 0
	set_process(false)
	
	tween.interpolate_property(
		camera,
		"offset",
		camera.offset,
		default_offset,
		0.1,
		Tween.TRANS_QUAD,
		Tween.EASE_IN_OUT
	)
	tween.start()
