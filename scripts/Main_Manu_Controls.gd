extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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

