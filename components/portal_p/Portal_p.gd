extends Area2D
signal portalEntered;
func _ready():
	getPositionOffset("left")

var counter = 0;
var disabled = false;
func _physics_process(delta):
	if counter >0:
		disabled = true;
		print("counter", counter);
		counter -= delta;
	else:
		disabled = false;
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
		print("type and body received at P", type, body);
		if type == "Portal_p" && !disabled:
			disabled = true;
			counter = 10;
			print("type and body received at P inside", type, body);
			body.position.x = self.position.x;
			body.position.y = self.position.y;
			
			
#			body.position.x = body.position.x - self.position.x;
#			body.position.y = body.position.y - self.position.y;
			
			var newPosition = body.position
			print("body, self", body.position, self.position);
		#self.emit_signal("portalEntered", "Portal_g",body);
	pass # Replace with function body.

func _on_Portal_body_entered(body):
	if (global.level_pause): return;
	if (body.name == "Player"):
		self.emit_signal("portalEntered", "Portal_p",body);
	pass # Replace with function body.

	pass # Replace with function body.
