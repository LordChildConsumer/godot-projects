extends RigidBody2D

class_name projectile

# Node References

# Constants


# Variables
#export var damage: float = 10
#export var speed: float = 750

var direction: Vector2

# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	if direction != null:
		look_at(self.global_position + direction)
		self.apply_central_impulse(direction * PlayerStats.proj_speed)
	else:
		print("Bullet direction not set")
		self.queue_free()

func _process(delta):
	pass

func _physics_process(delta):
	pass

# ------------------------
# --- Custom Functions ---
# ------------------------

func _on_Bullet_Hit(body):
	if body != null && body.has_method("take_damage"):
		body.take_damage(PlayerStats.damage)
