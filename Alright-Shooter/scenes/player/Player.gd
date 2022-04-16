extends KinematicBody2D

# Enums


# Node/Scene References
onready var mouse_cursor_idle = preload("res://assets/UI/cursors/GeoShooter-crosshair1.png")
onready var mouse_cursor_click = preload("res://assets/UI/cursors/GeoShooter-crosshair2.png")

onready var bullet_impact_fx = preload("res://materials/particles/ParticleEffect.tres")

onready var player_cam = $Camera
onready var anim = $AnimationPlayer
onready var muzzle = $Muzzle
onready var raycast = $Muzzle/Raycast
onready var bullet_trail = $Muzzle/Trail


# Constants


# Variables
var can_shoot = true

var friction = .2
var acceleration = .2

var velocity = Vector2()

# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	pass

func _process(delta):
	# Make the camera all fancy like
	player_cam.global_position = lerp(self.global_position, get_global_mouse_position(), 0.15)
	
	# Always aim at the mouse
	self.look_at(get_global_mouse_position())

func _physics_process(delta):
	var direction = get_input()
	
	# If there's any player input
	if direction.length() > 0:
		# Accelerate
		velocity = lerp(velocity, direction.normalized() * PlayerStats.move_speed, acceleration)
	else:
		# Decelerate
		velocity = lerp(velocity, Vector2.ZERO, friction)
	
	# Move
	velocity = move_and_slide(velocity)
	
	# Shooting
	if Input.is_action_pressed("shoot"):
		
		Input.set_custom_mouse_cursor(mouse_cursor_click)
		
		if can_shoot == true:
			can_shoot = false
			anim.play("Shoot")
			
			# If the player's shot would hit anything
			if raycast.is_colliding():
				# pos, mat, amount, life, norm
				EventBus.emit_signal("spawnParticles",
				
				raycast.get_collision_point(),				# Pos
				bullet_impact_fx,							# Mat
				8, 											# Amount
				.5,  										# Life
				raycast.get_collision_normal()  			# Normal
				
				)
				
				bullet_trail.points[1] = to_local(raycast.get_collision_point())
				
				if raycast.get_collider().has_method("hurt"):
					raycast.get_collider().call_deferred("hurt", PlayerStats.damage)
				
				#EventBus.emit_signal("shakePlayerCamera", 25, 0.4, 100)
			
			
			yield(anim, "animation_finished")
			can_shoot = true
	else:
		Input.set_custom_mouse_cursor(mouse_cursor_idle)

# ------------------------
# --- Custom Functions ---
# ------------------------

# Toggle whether or not the trail is being emitted

# I don't really need a comment here do I?
func get_input():
	var input = Vector2()
	
	
	if Input.is_action_pressed("move_up"):
		input.y -= 1
	if Input.is_action_pressed("move_down"):
		input.y += 1
	
	if Input.is_action_pressed("move_left"):
		input.x -= 1
	if Input.is_action_pressed("move_right"):
		input.x += 1
	
	return input

# Updates the animation player to be the attach speed
func _on_Set_Attack_Speed(value):
	anim.playback_speed = value
