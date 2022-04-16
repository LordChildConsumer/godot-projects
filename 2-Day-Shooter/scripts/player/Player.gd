extends KinematicBody2D
class_name Player

# Signals
signal fire_bullet(pos, dir)

# Enums


# Node/Scene References
onready var cam = $Camera2D
onready var timer = $Timer
onready var muzzle = $Muzzle
onready var gun_sound = $Audio/Shoot
onready var hurt_sound = $Audio/Hurt
onready var health_bar = $Camera2D/HUD/HealthBar

# Constants
const move_speed = 250
const max_health = 100


# Variables
onready var curr_health = max_health

var can_shoot = true

var acceleration = 0.25
var friction = 0.25

var velocity = Vector2()


# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	pass

func _process(delta):
	look_at(get_global_mouse_position())
	cam.global_position = lerp(self.global_position, get_global_mouse_position(), 0.15)
	if health_bar.value != curr_health:
		health_bar.value = lerp(health_bar.value, curr_health, 0.25)

func _physics_process(delta):
	var dir = Vector2()
	
	# Basic input
	if Input.is_action_pressed("move_up"):
		dir.y -= 1
	if Input.is_action_pressed("move_down"):
		dir.y += 1
	if Input.is_action_pressed("move_left"):
		dir.x -= 1
	if Input.is_action_pressed("move_right"):
		dir.x += 1
	
	dir = dir.normalized()
	
	# Acceleration
	if dir != Vector2.ZERO:
		velocity = lerp(velocity, dir * move_speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	
	move_and_slide(velocity)
	
	# Shooting
	if Input.is_action_pressed("shoot") && can_shoot:
		can_shoot = false
		var dir_to_mouse = muzzle.global_position.direction_to(get_global_mouse_position())
		
		emit_signal("fire_bullet", muzzle.global_position, dir_to_mouse)
		gun_sound.play()
		
		timer.start()
		yield(timer, "timeout")
		can_shoot = true


# ------------------------
# --- Custom Functions ---
# ------------------------

func _on_Health_Update():
	pass

func damage(damage):
	hurt_sound.play()
	curr_health -= damage
	
	print("Damage: %s\nHealth: %s" % [damage, curr_health])
	
	if curr_health <= 0:
		EventBus.emit_signal("switchScene", "res://scenes/menus/YouLose.tscn")
