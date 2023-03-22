extends CanvasLayer

# Update the FPS display every frame
func _process(_delta):
	update_debug()

# Update the FPSLabel text with the current FPS
func update_debug():
	if Global.show_debug_hud:
		var fps = str(int(Engine.get_frames_per_second()))
		$FPSLabel.text = "FPS: " + fps
	else:
		$FPSLabel.text = ""
