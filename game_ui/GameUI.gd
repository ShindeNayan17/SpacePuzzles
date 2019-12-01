extends Node2D

var currentScore = 0;
var enableEditing = false;
func _ready():
	enableEditing = true;
	pass;

func _physics_process(delta):
#	print("$score.request_ready()", $score.request_ready());
	if enableEditing:
		var score = global.score;
		if( currentScore != score ):
			currentScore = score;
			$score.text = str(currentScore);
	pass
