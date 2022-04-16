extends Node2D
class_name Level

# Enums


# Node/Scene References
onready var player_proj_scene = preload("res://scenes/projectiles/Projectile.tscn")
onready var enemy_proj_scene = preload("res://scenes/projectiles/EnemyProjectile.tscn")

# Constants


# Variables


# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	EventBus.emit_signal("ready")
	get_node_or_null("Player").connect("fire_bullet", self, "_on_Bullet_Fired")
	get_node_or_null("StationaryTurret").connect("fire_bullet", self, "_on_Enemy_Fired")

func _process(delta):
	pass

func _physics_process(delta):
	pass


# ------------------------
# --- Custom Functions ---
# ------------------------

# Instance bullet and set pos/dir
func _on_Bullet_Fired(pos, dir):
	var projectile = player_proj_scene.instance()
	projectile.global_position = pos
	projectile.set_direction(dir)
	self.add_child(projectile)

func _on_Enemy_Fired(pos, dir):
	var projectile = enemy_proj_scene.instance()
	projectile.global_position = pos
	projectile.set_direction(dir)
	self.add_child(projectile)
