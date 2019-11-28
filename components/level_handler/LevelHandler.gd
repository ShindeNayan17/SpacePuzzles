extends Node2D

signal levelSignal;
func _init():
	load_level(global.current_level);

var total_bricks setget set_total_bricks, get_total_bricks

var lb


func handleLevelEvents(eventType, payload):
	lb.handleEvents(self, eventType, payload);
	pass;

func resetLevel():
	for i in range (get_child_count()):
		#if(is Moving entity) get_child(i).queue_free()
		pass;
	lb.addMovingEntities(self);
	
	pass;
func load_level(level):
	global.level_pause = true;
	var path = "res://components/level_handler/levels/"+str(level)+".gd";
	var level_builder=load("res://components/level_handler/levels/"+str(level)+".gd");
	lb = level_builder.new();
	print("childs", get_child_count());
	for i in range (get_child_count()):
		get_child(i).queue_free()
	total_bricks=lb.init_level(self)
	global.level_pause = false;
	

func level_complete():
	var nextLevel = global.getNextLevel();
	if global.current_level == nextLevel:
		#game complete
		pass;
	else:
		global.current_level = nextLevel;
		load_level(global.current_level);

func set_total_bricks(tb):
	total_bricks=tb
	
func get_total_bricks():
	return total_bricks
	