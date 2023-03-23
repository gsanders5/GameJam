extends KinematicBody2D

export (int) var speed = 250
export (int) var jump_force = 500
var velocity = Vector2()
var is_idle = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle");


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(_delta):
	# If moving swap animation
	if Input.is_action_just_pressed("move_right"):
		$AnimationPlayer.play("Walk_Right")
		is_idle = false
	elif Input.is_action_just_pressed("move_left"):
		$AnimationPlayer.play("Walk_Left")
		is_idle = false

	# If not moving swap to the idle animation
	if !Input.is_action_pressed("move_right") && !Input.is_action_pressed("move_left") && !Input.is_action_pressed("jump"):
		$AnimationPlayer.play("Idle")
		is_idle = true
	
	if (!is_on_floor() && (!Input.is_action_pressed("move_left") || !Input.is_action_pressed("move_right"))):
		$Walk_Sound.playing = false
	elif is_idle:
		$Walk_Sound.playing = false
	elif !is_idle:
		_start_walk_sound()
		
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

func _start_walk_sound():
	if !$Walk_Sound.playing:
		$Walk_Sound.playing = true
