extends RigidBody2D
class_name Projectile

# Exports
export (float) var move_speed = 750
export (int) var damage = 10

# Enums


# Node/Scene References
onready var anim = $AnimationPlayer


# Constants


# Variables
onready var direction: Vector2 setget set_direction

# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	if direction != null:
		self.look_at(self.global_position + direction)
		self.apply_central_impulse(direction * move_speed)
	else:
		queue_free()

func _process(delta):
	pass

func _physics_process(delta):
	pass


# ------------------------
# --- Custom Functions ---
# ------------------------

func set_direction(value):
	direction = value


func _on_Projectile_body_entered(body):
	self.set_physics_process(false)
	anim.play("impact")
	if body.has_method("damage"):
		body.damage(damage)


func _on_Timer_timeout():
	self.queue_free()
