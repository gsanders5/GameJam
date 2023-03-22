extends CanvasLayer

# Update the FPS display every frame
func _process(_delta):
	update_fps()

# Update the FPSLabel text with the current FPS
func update_fps():
	var fps = str(int(Engine.get_frames_per_second()))
	$FPSLabel.text = "FPS: " + fps
