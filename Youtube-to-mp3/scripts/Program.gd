extends Control

# Exports


# Enums


# Node/Scene References
onready var url_value = $VBoxContainer/URL/LineEdit
onready var output_value = $VBoxContainer/Output/LineEdit

onready var term_output = $VBoxContainer/TermOutput/TextEdit

# Constants


# Variables
var command_results = []

var url = "https://youtu.be/dQw4w9WgXcQ"
var output = "%(title)s.%(ext)s"

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

func write_line(text):
	term_output.text = "%s\n%s" % [term_output.text, text]

func download_mp3():
	write_line("Download started.")
	
	if url_value.text == "":
		write_line('--- INVALID URL GIVEN ---')
		return
	url = url_value.text
	
	if output_value.text != "":
		output = output_value.text
	
	var exit_code = OS.execute(
		'youtube-dl',
			["--extract-audio",
			"--audio-format",
			"mp3",
			"-o",
			str('"', output_value.text, '"'),
			url_value.text],
			false,
			command_results
		)
	
	print("executed")
	
	for line in command_results:
		write_line(line)
		print(line)
