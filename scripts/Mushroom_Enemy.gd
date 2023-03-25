extends KinematicBody2D

# Movement variables
var speed = 75
var direction = -1
var ignore_next_collision = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Jump")

func _physics_process(delta):
	var velocity = Vector2(direction * speed, 0)

	# If either ray collides and we're not ignoring the next collision, change direction
	if not ignore_next_collision and ($RightWall.is_colliding() or $LeftWall.is_colliding()):
		direction *= -1
		ignore_next_collision = true
		$Sprite.flip_h=!$Sprite.flip_h
	elif not $RightWall.is_colliding() and not $LeftWall.is_colliding():
		ignore_next_collision = false

	# Move the enemy
	velocity.y += 20  # Apply gravity
	move_and_slide(velocity)

# If an enemy gets too close, swap movement direction.
func _on_Detect_Other_Enemy_body_entered(body):
	if body.is_in_group("enemy"):
		$Sprite.flip_h=!$Sprite.flip_h
		direction *= -1
	pass # Replace with function body.
