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

var currentPlayerSpeed = SPEED;
var isPlayerMoving = false;
var velocity = Vector2()
var screensize;
var bounceBack = false;
var bounceNormal = Vector2();
var mousePosition = Vector2();
var playerAngle = 0;
var lineCollidingPointNormal = Vector2();
var playedDead = false;
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

func playerBounce(collision_info):
	var currentDirection = direction;
	var normal = collision_info.normal;
	var collidingPoint = collision_info.position;
	direction = currentDirection.bounce(normal);
	$"Sprite".rotate(PI);
	bounceBack = false;

func handleCollision(collision_info):
	var collider = collision_info.collider;
	if collider && collider.has_method("collide"):
		collider.collide(self);
	pass;

func _physics_process(delta):
	if (global.level_pause): return;
	#lineCollidingPointNormal = $"playerRay".get_collision_normal();
	var collision_info  = self.move_and_collide(direction * currentPlayerSpeed);
	rotate_player();
	if collision_info:
#		take_damage
		
		
		handleCollision(collision_info);
		if(!bounceBack):
			if (isPlayerMoving): isPlayerMoving = false;
			currentPlayerSpeed = 0;
#			direction = Vector2(0,0);
		else:
			playerBounce(collision_info);
		
		#print("collided, player idle");
		
		pass;
	else:
		if (!isPlayerMoving): isPlayerMoving = true;
		#print("player in motion");
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
		var mouseReleased = !event.is_pressed();
		var clickType = event.get_button_index()
		if mouseReleased && clickType == BUTTON_LEFT:
			currentPlayerSpeed = SPEED;
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

func rotate_player():
	if playerAngle != direction.angle():
		playerAngle = direction.angle();
		if isPlayerMoving: 
			pass;
#			print("angle", direction.angle() );
#			$"Sprite".rotation = lineCollidingPointNormal.angle() + PI/2 ;
		else:
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
		_on_Player_player_killed();

func _on_Player_player_killed():
#	emit_signal("restart_level", "Player", "restartLevel");
	print("killed");
	if !playedDead:
		$blast.show();
		playedDead = true;
		$playerKilled.play();
		
	# self.queue_free();
#	$kill_effects.start();
	pass # Replace with function body.

func _on_kill_effects_tween_completed(object, key):
#	emit_signal("restart_level", "Player", "restartLevel");
	
	pass # Replace with function body.


func _on_playerKilled_finished():
	print("audio complete");
	
	emit_signal("restart_level", "Player", "restartLevel");
	
	pass # Replace with function body.
