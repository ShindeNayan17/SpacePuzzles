extends Node2D

func _ready():
	if global.current_level == "01": $mouse.show();
	else: $mouse.hide();
	
	pass
