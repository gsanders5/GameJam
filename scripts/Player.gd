extends KinematicBody2D

export (int) var speed = 250
export (int) var jump_force = 570
var velocity = Vector2()
var is_idle = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle");
	Global.is_dead = false
	$Camera2D/YouDied.visible = false
	$Camera2D.drag_margin_h_enabled = true;
	$Camera2D.drag_margin_v_enabled = true;
	# Assuming your Area2D node is named "PlayerArea2D"
	$HurtBox.connect("area_entered", self, "_on_PlayerArea2D_area_entered")
	$HurtBox.connect("body_entered", self, "_on_PlayerArea2D_body_entered")

# Kill the player
func kill():
	if !Global.is_dead:
		Global.is_dead = true
		$Camera2D/YouDied.visible = true
		$Camera2D.drag_margin_h_enabled = false;
		$Camera2D.drag_margin_v_enabled = false;
		$Wilhelm.play()
	
func _physics_process(_delta):
	# If moving swap animation
	# If moving right play the animation
	if Input.is_action_just_pressed("move_right") && !Global.is_dead:
		$AnimationPlayer.play("Walk_Right")
		is_idle = false
	# If moving left play the animation
	elif Input.is_action_just_pressed("move_left")&& !Global.is_dead:
		$AnimationPlayer.play("Walk_Left")
		is_idle = false
	# If not moving swap to the idle animation
	elif !Input.is_action_pressed("move_right") && !Input.is_action_pressed("move_left") && !Input.is_action_pressed("jump"):
		$AnimationPlayer.play("Idle")
		is_idle = true
	
	# Play walking sound / stop playing the sound
	# WAS: if !is_on_floor() or is_idle or (!Input.is_action_pressed("move_left") and !Input.is_action_pressed("move_right")):
	# But this caused some sound issues when walking over tiny differences in terrain
	if Global.is_dead or !$NearGround.is_colliding() or is_idle or (!Input.is_action_pressed("move_left") and !Input.is_action_pressed("move_right")):
		$Walk_Sound.playing = false
	else:
		_start_walk_sound()

		
	# Horizontal movement
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x *= speed

	# Vertical movement
	if $NearGround.is_colliding() and Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force
	else:
		velocity.y += 20  # Apply gravity

	# Move character
	velocity = move_and_slide(velocity, Vector2.UP)

func _start_walk_sound():
	if !$Walk_Sound.playing:
		$Walk_Sound.playing = true


func _on_HurtBox_area_entered(area):
	print("Hurtbox entered")
	if area.is_in_group("killplayer"):
		kill()
	pass # Replace with function body.


func _on_HurtBox_body_entered(body):
	print("Hurtbox (body) entered")
	if body.is_in_group("killplayer"):
		kill()
	pass # Replace with function body.
