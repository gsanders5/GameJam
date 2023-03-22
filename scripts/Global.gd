extends Node

func _ready():
	# Make this node persistent across scenes
	set_process_unhandled_input(true)


func _unhandled_input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		# Toggle full-screen mode
		var is_fullscreen = OS.window_fullscreen
		OS.window_fullscreen = !is_fullscreen
