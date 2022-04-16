extends KinematicBody

const mouse_sens = 0.5

var normal_speed = 15
var walk_speed = 7
var speed = 15
var h_acceleration = 7
var air_acceleration = 2
var normal_acceleration = 7
var gravity = 20
var jump = 10

var full_contact = false

var direction = Vector3()
var h_velocity = Vector3()
var movement = Vector3()
var gravity_vec = Vector3()

onready var anim = $Head/AnimationPlayer
onready var head = $Head
onready var ground_check = $GroundCheck
onready var interact = $Head/Interact
onready var hud = $HUD

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * (mouse_sens / 10)))
		head.rotate_x(deg2rad(-event.relative.y * (mouse_sens / 10)))
		head.rotation.x = clamp(head.rotation.x, deg2rad(-89), deg2rad(89))

func _physics_process(delta):
	direction = Vector3()
	
	if ground_check.is_colliding():
		full_contact = true
	else:
		full_contact = false
	
	if not is_on_floor():
		gravity_vec += Vector3.DOWN * gravity * delta
		h_acceleration = air_acceleration
	elif is_on_floor() and full_contact:
		gravity_vec = -get_floor_normal() * gravity
		h_acceleration = normal_acceleration
	else:
		gravity_vec = -get_floor_normal()
		h_acceleration = normal_acceleration
		
	if Input.is_action_just_pressed("jump") and (is_on_floor() or ground_check.is_colliding()):
		gravity_vec = Vector3.UP * jump
	
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	elif Input.is_action_pressed("move_backward"):
		direction += transform.basis.z
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	elif Input.is_action_pressed("move_right"):
		direction += transform.basis.x

	if direction != Vector3.ZERO:
		anim.play("WeaponBob")
	else:
		anim.play("RESET")

	## Prevent player from moving faster if going diagonal using
	direction = direction.normalized();
	
	
	h_velocity = h_velocity.linear_interpolate(direction * speed, h_acceleration * delta)
	movement.z = h_velocity.z + gravity_vec.z
	movement.x = h_velocity.x + gravity_vec.x
	movement.y = gravity_vec.y
	
	
	move_and_slide(movement, Vector3.UP)
	
	
	# --- Interact with stuff ---
	if interact.is_colliding():
		var interactable = interact.get_collider()
		var interact_key = InputMap.get_action_list("interact")
		hud.set_interact_text("Press %s to %s" % [interact_key[0].as_text(), interactable.get_interact_text()])
		
		if Input.is_action_just_pressed("interact") && interactable.can_interact():
			interactable.interact()
		
	else:
		hud.set_interact_text("")
		
