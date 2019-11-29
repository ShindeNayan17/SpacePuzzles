extends Area2D

signal doorEntered;

var isDoorOpened = true;
var enableEvents = false;
onready var topDoor = preload("res://textures/Tiles/platformPack_tile048.png");
onready var bottomDoor = preload("res://textures/Tiles/platformPack_tile057.png");
func _ready():
	$Timer.connect("timeout",self,"_on_timer_timeout") ;
	updateDoor();
	pass

func collide(params):
	print("handling event at doorvertical.gd")
	# 
	self.emit_signal("doorEntered", doorAction);

var doorAction = null;
export (String, "top","bottom") var doorParts setget set_doorParts;




func set_doorParts(part):
	doorParts = part;
	if self.has_node("DoorSprite"):
		updateDoor();
	
func updateDoor():
	if doorParts == "top":
		$"DoorSprite".texture = topDoor;
	else:
		$"DoorSprite".texture = bottomDoor;
func set_enableEvents(flag):
	enableEvents = flag;
func set_doorAction(action):
	doorAction = action;
	
#func _on_DoorVertical_area_entered(area):
#	print("_on_DoorVertical_area_entered called");
##	if isDoorOpened :
##		pass;
#
#		#self.emit_signal("doorEntered", doorAction);
#	pass # Replace with function body.
#


func _on_DoorVertical_body_entered(body):
	if (global.level_pause): return;
	if(enableEvents):
		if (body.name == "Player"):
			$Timer.set_wait_time(2);
			$Timer.start();
			if doorAction == "end":
				body.showLoading();
			
	pass # Replace with function body.

func _on_timer_timeout():
	self.emit_signal("doorEntered", "doorVertical",doorAction);
	$Timer.stop();
	pass;