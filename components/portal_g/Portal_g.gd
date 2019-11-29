extends Area2D
signal portalEntered;
var disabled = false;
func _ready():
	getPositionOffset("left")
	$Timer.connect("timeout",self,"_on_timer_timeout") 
	
func getPositionOffset(dir):
	var positionOffset = Vector2(0,0);
	var portalSprite = $"PortalSprite";
	if dir == "left":
		positionOffset.x = -32;
		portalSprite.flip_h = false;
	if dir == "right":
		positionOffset.x = 32;
		portalSprite.flip_h = true;
	if dir == "top":
		self.rotation_degrees = 90;
		portalSprite.flip_v = false;
		positionOffset.y = 32;
	if dir == "bottom":
		positionOffset.y = -32;
		portalSprite.flip_v = true;
		self.rotation_degrees = 90;
	return positionOffset;	
	update();
	pass;

func _on_Portal_body_received(type, body):
	print("type ,body");
	if (global.level_pause): return;
	if (body.name == "Player" ):
		print("type and body received at G", type, body);
		if type == "Portal_g"  && !disabled:
			disabled = true;
			$Timer.set_wait_time(3);
			$Timer.start();
			body.position.x = self.position.x;
			body.position.y = self.position.y;

func _on_timer_timeout():
	disabled = false
	$Timer.stop();
	pass;
#func delay(sec):
#	$Timer.set_wait_time(sec);
#	$Timer.set_one_shot(true);
#	$Timer.start();
#	yield($Timer, "timeout");
func _on_Portal_body_entered(body):
	if (global.level_pause): return;
	if (body.name == "Player" && !disabled):
		self.emit_signal("portalEntered", "Portal_g",body);
	pass # Replace with function body.

	pass # Replace with function body.
