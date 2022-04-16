extends Node2D

# Enums
enum {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

# Node/Scene References
onready var head = $Head
onready var body = $Body
onready var timer = $Timer

# Constants


# Variables
var shooting = false

var body_direction
var head_direction

# -----------------------
# --- Godot Functions ---
# -----------------------

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	pass


# ------------------------
# --- Custom Functions ---
# ------------------------

# --- General Functions ---
func process_direction(direction):
	# Right
	if direction.x > 0:
		play_Walk_Right()
		return
	# Left
	if direction.x < 0:
		play_Walk_Left()
		return
	# Down
	if direction.y > 0:
		play_Walk_Down()
		return
	# Up
	if direction.y < 0:
		play_Walk_Up()
		return

func stop_all_animations():
	head.playing = false
	head.frame = 0
	body.playing = false
	body.frame = 0
	body_direction = null
	head_direction = null


# --- Body Functions ---
# Walk Up
func play_Walk_Up():
	if body_direction != UP:
		body_direction = UP
		body.animation = "down"
		body.flip_h = false
		body.playing = true

# Walk Down
func play_Walk_Down():
	if body_direction != DOWN:
		body_direction = DOWN
		body.animation = "down"
		body.flip_h = false
		body.playing = true

# Walk Left
func play_Walk_Left():
	if body_direction != LEFT:
		body_direction = LEFT
		body.animation = "left_right"
		body.flip_h = true
		body.playing = true

# Walk Right
func play_Walk_Right():
	if body_direction != RIGHT:
		body_direction = RIGHT
		body.animation = "left_right"
		body.flip_h = false
		body.playing = true

# None
func stop_Body_Animations():
	body_direction = null
	body.playing = false
	body.animation = "down"
	body.frame = 0


# --- Head Functions ---
# Shoot Up
func play_Shoot_Up():
	if head_direction != UP:
		head_direction = UP
		head.animation = "up"
		head.playing = true
		yield(head, "animation_finished")
		stop_Head_Animations()

# Shoot Down
func play_Shoot_Down():
	if head_direction != DOWN:
		head.frame = 0
		head_direction = DOWN
		head.animation = "down"
		head.playing = true
		yield(head, "animation_finished")
		stop_Head_Animations()

# Shoot Left
func play_Shoot_Left():
	if head_direction != LEFT:
		head_direction = LEFT
		head.animation = "left_right"
		head.flip_h = true
		head.playing = true
		yield(head, "animation_finished")
		stop_Head_Animations()

# Shoot Right
func play_Shoot_Right():
	if head_direction != RIGHT:
		head_direction = RIGHT
		head.animation = "left_right"
		head.flip_h = false
		head.playing = true
		yield(head, "animation_finished")
		stop_Head_Animations()

# None
func stop_Head_Animations():
	head_direction = null
	head.playing = false
	head.animation = "down"
	head.frame = 1
