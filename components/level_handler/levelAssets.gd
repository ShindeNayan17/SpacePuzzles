extends Reference

#var separation

# all scene components of all levels
var wallSimple;
var wallAnimated;


func _init():
	wallSimple = load("res://components/waill_simple/WallSimple.tscn");	
	wallAnimated = load("res://components/wall_animated/WallAnimated.tscn");
	


func init_level(level_node):
	#each level file must define this function
	pass