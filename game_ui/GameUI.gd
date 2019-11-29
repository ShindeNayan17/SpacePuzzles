extends Node2D

var currentScore = 0;
func _ready():
	pass;

func _physics_process(delta):
	if $score.request_ready():
		var score = global.score;
		if( currentScore != score ):
			currentScore == score;
			$score.text = score;
	pass
