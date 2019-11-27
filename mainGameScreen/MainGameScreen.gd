extends Node2D

func _ready():
	#$"LevelHandler".bindEvents(self);
	$"Player".connect("restart_level",self, "handle_restart_level");
	# $"LevelHandler".connect("restart_level",self, "handle_restart_level");
	pass



func handle_restart_level():
	$"Player".resetPlayer();
	$"LevelHandler".resetLevel();