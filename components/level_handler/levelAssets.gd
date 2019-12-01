extends Reference

#var separation

# all scene components of all levels
var player;
var wallSimple;
var wallAnimated;
var spikes;
var doorVertical;
var portal_p;
var portal_g;
var bgAnimated;
var level_instructions;
var wallBouncy;
var gems;
#var level01 = preload("res://textures/levels/01.png");

func _init():
	player = load ("res://components/player/Player.tscn");
	wallSimple = load("res://components/waill_simple/WallSimple.tscn");	
	wallAnimated = load("res://components/wall_animated/WallAnimated.tscn");
	wallBouncy = load("res://components/wall_bouncy/WallBouncy.tscn");
	spikes = load ("res://components/spikes/Spikes.tscn");
	doorVertical = load ("res://components/doorVertical/DoorVertical.tscn");
	portal_p = load ("res://components/portal_p/Portal_p.tscn");
	portal_g = load ("res://components/portal_g/Portal_g.tscn");
	bgAnimated = load ("res://components/bg_animated/BgAnimated.tscn");
	level_instructions = load ("res://components/level_instructions/Instructions.tscn");
	gems = load("res://components/gems/Gems.tscn");


func init_level(level_node):
	#each level file must define this function
	pass