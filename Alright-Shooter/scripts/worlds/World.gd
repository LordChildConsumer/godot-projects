extends Node2D
class_name GameWorld

# Node/Scene References
onready var bullet = preload("res://scenes/projectiles/PlayerProjectile.tscn")
onready var particle_fx = preload("res://scenes/particles/ParticleEffect.tscn")

# Variables


# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	EventBus.connect("spawnParticles", self, "_instance_Particle_Effects")


# ------------------------
# --- Custom Functions ---
# ------------------------

# Summon particle effects
func _instance_Particle_Effects(pos, mat, amount, life, norm):
	#print("Pos: %s\nMat: %s\nAmount: %s\nLife: %s\nNorm: %s" % [pos, mat, amount, life, norm])
	
	var particle_instance = particle_fx.instance()
	
	particle_instance.global_position = pos
	particle_instance.process_material = mat
	particle_instance.amount = amount
	particle_instance.lifetime = life
	particle_instance.look_at(pos + norm)
	particle_instance.get_node("Timer").wait_time = float(life + 5)
	
	particle_instance.emitting = true
	self.add_child(particle_instance)
	
	yield(particle_instance.get_node("Timer"), "timeout")
	particle_instance.queue_free()
