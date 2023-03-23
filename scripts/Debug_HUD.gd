extends CanvasLayer

# Update the FPS display every frame
func _process(_delta):
	# Make this node persistent across scenes
	set_process_unhandled_input(true)
	update_debug()

# Update the FPSLabel text with the current FPS
func update_debug():
	if Global.show_debug_hud:
		$FPSLabel.visible = true
		var fps = str(int(Engine.get_frames_per_second()))
		$FPSLabel.text = "FPS: " + fps
	elif $FPSLabel.visible == true:
		$FPSLabel.visible = false

func _unhandled_input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		toggle_fullscreen()
	if event.is_action_pressed("quit_game"):
		get_tree().quit()

func toggle_fullscreen():
		# Toggle full-screen mode
		var is_fullscreen = OS.window_fullscreen
		OS.window_fullscreen = !is_fullscreen
