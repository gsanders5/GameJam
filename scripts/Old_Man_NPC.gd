extends KinematicBody2D

var speechBubble = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")
	$AnimationPlayer2.play("Speech")

func _speakNextBubble():
	match speechBubble:
		0:
			$Speech/SpeechBubble.visible = true;
			$Speech/SpeechBubble2.visible = false;
			$Speech/SpeechBubble3.visible = false;
			speechBubble += 1
		1:
			$Speech/SpeechBubble.visible = false;
			$Speech/SpeechBubble2.visible = true;
			$Speech/SpeechBubble3.visible = false;
			speechBubble += 1
		2:
			$Speech/SpeechBubble.visible = false;
			$Speech/SpeechBubble2.visible = false;
			$Speech/SpeechBubble3.visible = true;
			speechBubble += 1
		3:
			$Speech/SpeechBubble.visible = false;
			$Speech/SpeechBubble2.visible = false;
			$Speech/SpeechBubble3.visible = false;
			speechBubble += 1
		_:
			speechBubble = 0
