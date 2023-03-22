extends KinematicBody2D

export (int) var speed = 250
export (int) var jump_force = 500
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(_delta):
	# Horizontal movement
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x *= speed

	# Vertical movement
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force
	else:
		velocity.y += 20  # Apply gravity

	# Move character
	velocity = move_and_slide(velocity, Vector2.UP)
