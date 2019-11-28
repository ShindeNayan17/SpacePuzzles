extends Reference

#var separation

# all scene components of all levels
var wallSimple;
var wallAnimated;
var spikes;
var doorVertical;
var portal_p;
var portal_g;
#var level01 = preload("res://textures/levels/01.png");

func _init():
	wallSimple = load("res://components/waill_simple/WallSimple.tscn");	
	wallAnimated = load("res://components/wall_animated/WallAnimated.tscn");
	spikes = load ("res://components/spikes/Spikes.tscn");
	doorVertical = load ("res://components/doorVertical/DoorVertical.tscn");
	portal_p = load ("res://components/portal_p/Portal_p.tscn");
	portal_g = load ("res://components/portal_g/Portal_g.tscn");
	
	


func init_level(level_node):
	#each level file must define this function
	pass