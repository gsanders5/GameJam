extends VBoxContainer

func _process(_delta):
	# Make this node persistent across scenes
	set_process_unhandled_input(true)

func _on_StartButton_pressed():
	# Load your first game scene
	var level_one_scene = load("res://scenes/GameLevels/Level_One.tscn")
	# Replace the main menu scene with the game scene
	get_tree().change_scene_to(level_one_scene)

func _on_QuitButton_pressed():
	# Quit the game
	get_tree().quit()

func _on_DebugButton_pressed():
	Global.show_debug_hud = !Global.show_debug_hud

func _on_ToggleFullscreenButton_pressed():
	print("Pressed")
	var is_fullscreen = OS.window_fullscreen
	OS.window_fullscreen = !is_fullscreen

func _unhandled_input(event):
	if event.is_action_pressed("submit"):
		_on_StartButton_pressed()
