extends Area2D

func _ready():
	getPositionOffset("left")

func getPositionOffset(dir):
	var positionOffset = Vector2(0,0);
	if dir == "left":
		positionOffset.x = -24;
	if dir == "right":
		positionOffset.x = 32;
	if dir == "top":
		self.rotation_degrees = 90;
		positionOffset.y = 32;
	if dir == "bottom":
		positionOffset.y = 32;
		self.rotation_degrees = -90;
	return positionOffset;	
	update();
	pass;
