extends KinematicBody2D

var direction = Vector2(-1,0);
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_SLIDE_STOP = 25.0

signal player_killed;
signal restart_level;
const HP_MAX = 5;
var hp = global.PLAYER_DEFAULT_LIVES;
export (int) var SPEED
export (int) var JUMP_SPEED

var isPlayerMoving = false;
var velocity = Vector2()
var screensize
var mousePosition = Vector2();
var playerAngle = 0;
var lineCollidingPointNormal = Vector2();
func _ready():
	screensize = get_viewport_rect().size;
	resetPlayer();
	pass

func showLoading():
	$Loading.show();
func resetPlayer():
	self.hide();
	self.position = global.player_init_position;
	hp = global.PLAYER_DEFAULT_LIVES;
	
	self.velocity = Vector2(0,0);
	direction = Vector2(0,1);
	self.show();
	$Loading.hide();

func handleCollision(collision_info):
	var collider = collision_info.collider;
	if collider.has_method("collide"):
		collider.collide(self);
	pass;
	
func _physics_process(delta):
	if (global.level_pause): return;
	var collision_info  = self.move_and_collide(direction * SPEED);
	rotate_player(delta);
	if collision_info:
#		take_damage
		
		
		if (isPlayerMoving): isPlayerMoving = false;
		handleCollision(collision_info);
		update();
		#print("collided, player idle");
		
		pass;
	else:
		if (!isPlayerMoving): isPlayerMoving = true;
		#print("player in motion");
	

	

func _physics_processsss(delta):
	#drawLine();
	velocity = Vector2()
	velocity = move_and_slide(velocity, FLOOR_NORMAL, SLOPE_SLIDE_STOP)
	var on_floor = is_on_floor()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if on_floor and Input.is_action_just_pressed("player_action_jump"):
		velocity.y = -JUMP_SPEED
		print("jump");
		#($SoundJump as AudioStreamPlayer2D).play()
	
	if Input.is_action_pressed("ui_up"):
		
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		#$AnimatedSprite.play()
		#$Trail.emitting = true
	else:
		pass;
		
		#$AnimatedSprite.stop()
		#$Trail.emitting = false

	position += velocity * delta
	#position.x = clamp(position.x, 0, screensize.x)
	#position.y = clamp(position.y, 0, screensize.y)

	#if velocity.x != 0:
		#$AnimatedSprite.animation = "right"
		#$AnimatedSprite.flip_v = false
		#$AnimatedSprite.flip_h = velocity.x < 0
	#elif velocity.y != 0:
		#$AnimatedSprite.animation = "up"
		#$AnimatedSprite.flip_v = velocity.y > 0

func _draw():
	if(!isPlayerMoving):
		var currentMouseDirection = get_local_mouse_position().normalized();
		$"playerRay".set_cast_to(currentMouseDirection*100000);
		if ($"playerRay".is_colliding()):
			var newPoint = $"playerRay".get_collision_point();
			var playerPosition = self.position;
			var relativeNewPoint = newPoint - playerPosition;
			removeLine();
			createLine(Vector2(0,0), relativeNewPoint);
			
			#draw_line(Vector2(0,0), relativeNewPoint, Color(1,1,1));
		
	#drawLine();
func createLine(from, to):
	$"playerLine".add_point(from)
	$"playerLine".add_point(to)

func removeLine():
  $"playerLine".points = []
func drawLine():
	#var playerPos = $"Player".get_position_in_parent();
	#print("playerPos", playerPos);
	
	#print("draw coordinates: ", mousePosition, " (0, 0)");
	
	pass;
	
	
	
func _input(event):
	
	# Mouse in viewport coordinates
	if event is InputEventMouseButton:
		print("mouse event");
		var mouseReleased = !event.is_pressed();
		var clickType = event.get_button_index()
		if (!isPlayerMoving && mouseReleased && clickType == BUTTON_LEFT ):
			direction = get_local_mouse_position().normalized();
			lineCollidingPointNormal = $"playerRay".get_collision_normal();
			removeLine();
		pass;
		#print("Mouse Click/Unclick at: ", event.position)
	elif event is InputEventMouseMotion:
		#var player$"Player".get_position_in_parent()
		mousePosition.x = event.position.x - self.position.x;
		mousePosition.y = event.position.y - self.position.y;
		update();
		#print("self.position", self.position)
		#print("view port Motion at: ", mousePosition);
		#print("Mouse Motion at: ", event.position)
		
		#print("Mouse Motion at: ", event.position)
		# Print the size of the viewport
		#print("Viewport Resolution is: ", get_viewport_rect().size)
func get_rot():
	
	return 

func rotate_player(delta):
	if playerAngle != direction.angle():
		playerAngle = direction.angle();
		
		$"Sprite".rotation = lineCollidingPointNormal.angle() + PI/2;
		
		#print("angle", normalAngle);
		#$"Sprite".rotation = normalAngle.angle();
#	
		#var aimPointer = get_local_mouse_position();
		
	#$"playerRay".set_cast_to();
	#$"playerRay".update();
	
#	if playerAngle != direction.angle():
#		playerAngle = direction.angle();
#	var selfPosition = self.position;
	#selfPosition += PI/2;
#	var spritePos = $"Sprite"
	#print("angle ",direction.angle());
	
	#$"Sprite".rotate( selfPosition.angle_to_point(direction));
#	 = playerAngle + PI;
	


func add_hp(health):
	pass;
func take_damage_percent(impact): # damage in percent
    impact = clamp(impact, 0.0, 1.0)
    var damage = HP_MAX * impact;
    var prev_hp = hp;
    hp -= damage
    hp = clamp(hp, 0, HP_MAX)

    if prev_hp != hp:
        emit_signal("damaged", damage)

    if hp <= 0.0:
        emit_signal("killed")

func take_damage(damage):
	var prev_hp = hp;
	hp -= damage
	hp = clamp(hp, 0, HP_MAX)
	if prev_hp != hp:
		pass;
		#emit_signal("player_damaged", damage)
	if hp <= 0.0:
#		pass;
		emit_signal("player_killed")

func _on_Player_player_killed():
	# self.queue_free();
	
	
	emit_signal("restart_level");
	pass # Replace with function body.