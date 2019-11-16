extends KinematicBody2D

var direction = Vector2(1,-1);

func _ready():
	drawLine();
	pass

func _draw():
    drawLine();
func drawLine():
	draw_line(direction * 600, Vector2(0,0), Color(1,1,1));
	#var from = new Vector2();
	
	pass;
	
func get_rot():
	return 
func _process(delta):
	direction.x = sin(get_rot())
	#direction.y = cos(get_rot())
	pass;