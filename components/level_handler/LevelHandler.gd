extends Node2D

signal levelSignal;
func _init():
	load_level(global.current_level);

var total_bricks setget set_total_bricks, get_total_bricks

var lb


func handleLevelEvents(eventType, payload):
	lb.handleEvents(self, eventType, payload);
	pass;

		
func create_timer(level_node, wait_time):
	var timer = Timer.new()
	timer.set_wait_time(wait_time)
	timer.set_one_shot(true)
	timer.connect("timeout", timer, "queue_free")
	level_node.add_child(timer)
	timer.start()
	return timer
	pass



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
	var nextLevel = global.getNextLevel(global.current_level);
	yield(create_timer(self, 2), "timeout")
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
	