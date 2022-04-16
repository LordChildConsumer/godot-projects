extends StaticBody2D
class_name turret

signal fire_bullet(pos, dir)

# Exports
export (int) var max_health
export (float) var fire_delay

export(float, 0, 360) var head_rot

export (bool) var can_attack
export (bool) var alerted
# Enums


# Node/Scene References
onready var top_sprite = $Top
onready var line = $Top/Line2D
onready var health_bar = $HealthBar
onready var gun_sound = $Audio/Shoot
onready var hurt_sound = $Audio/Hurt
onready var gun_timer = $Timer
onready var muzzle = $Top/Muzzle

# Constants


# Variables
onready var health = max_health
var target


# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	health_bar.max_value = max_health
	health_bar.value = max_health
	gun_timer.wait_time = fire_delay
	top_sprite.rotation_degrees = head_rot
	

func _process(delta):
	pass

func _physics_process(delta):
	if alerted && target != null:
		line.set_point_position(1, Vector2(abs((self.global_position.distance_to(target.global_position)) / 2), 0))
		top_sprite.look_at(target.global_position)
		shoot()

#func _physics_process(delta):
#	if clear_shot(target):
#		if alerted && target != null:
#			line.set_point_position(1, Vector2(abs((self.global_position.distance_to(target.global_position)) / 2), 0))
#			top_sprite.look_at(target.global_position)
#			shoot()
#	else:
#		top_sprite.rotation_degrees = head_rot


# ------------------------
# --- Custom Functions ---
# ------------------------
func shoot():
	if can_attack:
		can_attack = false
		gun_timer.start()
		yield(gun_timer, "timeout")
		var dir_to_tar = muzzle.global_position.direction_to(target.global_position)
		emit_signal("fire_bullet", muzzle.global_position, dir_to_tar)
		gun_sound.play()
		can_attack = true

func damage(value):
	hurt_sound.play()
	health -= value
	health_bar.value = health
	if health <= 0:
		self.queue_free()

func clear_shot(t):
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(self.global_position, t.global_position, [], 1, true, false)
	return result.get("collider") == target

func _on_Detection_body_entered(body):
	if body is KinematicBody2D:
		# Check if the turret has LOS
		if clear_shot(body):
			target = body
			alerted = true
			can_attack = true
			$Detection.queue_free()
