tool
extends StaticBody2D

# a generic wall that can be made horizontal or vertical in the editor
# it adjusts its collision shape accordingly

export (String, "horizontal","vertical") var orientation setget set_orientation
export (bool) var inverted setget set_invert

#export (Color, RGBA) var color setget set_color
export (float) var width=16 setget set_width
export (float) var length=64 setget set_length
export (bool) var is_rotation=false setget set_is_rotation
export (float) var rotationSpeed=1 setget set_rotation_speed



var shape_owner
var tween
func _ready():
	if orientation==null:
		orientation="horizontal"
	
	if inverted==null:
		inverted=false;
	update_wall()

func damage(entity):
	#entity.take_damage(99999);
	pass;


#func _physics_process(delta):
#	if(is_rotation):
		# self.rotate(rotationSpeed * delta);

func update_wall():
	if !get_shape_owners().empty(): # the function can be called before the shape owner is created
		var spriteRect;
		var angleDegree = 0;
		if inverted:
			angleDegree = 180;
		else:
			angleDegree = 0;
		if(orientation=="horizontal"):
			angleDegree += 90;
			spriteRect = Rect2(0,0,length,width);
		else:
			spriteRect = Rect2(0,0,width,length);
		$"WallSprite".region_rect =spriteRect;
		$"WallSprite".rotation_degrees = angleDegree;
		
		if(is_rotation):
			
			print("tween connecting");
			var start = 0;
			var end = 360;
			if(orientation=="horizontal"):
				pass;
			else:
				start = 90;
				end = 450;
			tween = Tween.new()
			add_child(tween);
			
			tween.interpolate_property(
				self, "rotation_degrees", 
				start, end, 5,
				Tween.TRANS_LINEAR , Tween.TRANS_LINEAR )
			tween.set_repeat(true);
			tween.start()
			var spikeInstance = load("res://components/spikes/Spikes.tscn");
			var spikeLeft = spikeInstance.instance();
			var spikeRight = spikeInstance.instance();
		
			spikeLeft.set_width(width);
			spikeLeft.set_length(width);
			spikeLeft.set_orientation("horizontal");
			spikeLeft.set_invert(true);
			spikeRight.set_width(width);
			spikeRight.set_length(width);
			spikeRight.set_orientation("horizontal");
			spikeRight.set_invert(false);
			
			
			spikeLeft.position = Vector2(-width,length/2 - width/2);
			spikeRight.position = Vector2(width,-length/2 + width/2);
			add_child(spikeLeft);
			add_child(spikeRight);
		
		var so = get_shape_owners()[0]
		self.shape_owner_clear_shapes(so)
		var r = RectangleShape2D.new()
		if(orientation=="horizontal"):
			r.set_extents(Vector2(length/2,width/2))
		else:
			r.set_extents(Vector2(width/2,length/2))
		self.shape_owner_add_shape(so,r);
#		update()


#func _draw():
#	var r
#	if(orientation=="horizontal"):
#
#		r = Rect2(-length/2,-width/2,length,width)
#	else:
#		r = Rect2(-width/2,-length/2,width,length)
#	#draw_rect(r,color)


func set_orientation(o):
	orientation=o
	update_wall()

func set_color(c):
	#color=c
	update()

func set_width(w):
	width=w
	update_wall()

func set_length(l):
	length=l
	update_wall()
	
func set_invert(flag):
	inverted=flag;
	update_wall();

func set_is_rotation(flag):
	is_rotation = flag;
	update_wall();

func set_rotation_speed(speed):
	rotationSpeed = speed;
	update_wall();

	