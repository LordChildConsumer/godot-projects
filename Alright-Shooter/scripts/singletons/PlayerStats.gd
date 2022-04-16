extends Node


# --- Player Stats ---
var move_speed = 300
var attack_speed = 1		setget set_attack_speed, get_attack_speed
var damage = 10
var proj_speed = 750

var health


# --- Setters and Getters ---

#	Attack Speed
func set_attack_speed(value):
	attack_speed = value
func get_attack_speed():
	return attack_speed
