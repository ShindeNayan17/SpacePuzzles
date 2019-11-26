extends Node2D

func _init():
	load_level("01");

var total_bricks setget set_total_bricks, get_total_bricks
var lb

func load_level(level):
	var path = "res://components/level_handler/levels/"+str(level)+".gd";
	print(path);
	var level_builder=load("res://components/level_handler/levels/"+str(level)+".gd");
	lb = level_builder.new();
	
	for i in range (get_child_count()):
		get_child(i).queue_free()
	total_bricks=lb.init_level(self)
	

func set_total_bricks(tb):
	total_bricks=tb
	
func get_total_bricks():
	return total_bricks
	