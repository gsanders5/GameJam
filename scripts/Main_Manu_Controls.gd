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
	#var game_scene = load("res://path/to/your/first_game_scene.tscn")
	# Replace the main menu scene with the game scene
	#get_tree().change_scene_to(game_scene)
	pass # Replace with function body.


func _on_QuitButton_pressed():
	# Quit the game
	get_tree().quit()
